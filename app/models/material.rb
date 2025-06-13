class Material < ApplicationRecord
  belongs_to :study
  attr_accessor :file
  has_many :flashcards, dependent: :destroy

  def process_file(file)
    reader = PDF::Reader.new(file)

    # Read all pages and concatenate text
    all_text = ""
    reader.pages.each do |page|
      all_text += page.text + "\n"
    end

    # Truncate to 3000 characters if needed
    self.raw_content = all_text.length > 3000 ? all_text[0, 3000] : all_text

    # Make a call to OpenAI to get the summary of the PDF
    client = OpenAI::Client.new

    # Create a Name for the uploaded PDF
    title_response = client.chat(parameters: {
      "model": "gpt-4o-mini",
      "messages":
      [
        {
          role: "system",
          content: "You are an expert academic tutor. Generate concise, relevant titles for academic content."
        },
        {
          role: "user",
          content: "Read the content and generate a one to three word title that accurately reflects the topic.
                  Return only the title as raw plain text, with each word capitalized and separated by spaces.. Content: #{self.raw_content}"
        }
      ]
    })
    self.name = title_response["choices"][0]["message"]["content"]

    # Create a Description for the uploaded PDF
    description_response = client.chat(parameters: {
      "model": "gpt-4o-mini",
      "messages":
      [
        {
          role: "system",
          content: "You are an expert academic tutor. Write clear and concise descriptions for learning materials."
        },
        {
          role: "user",
          content: "Read the content and generate a short, informative description in one sentence, no more than 20 words.
                  Start the sentence with a strong verb and do not begin with phrases like 'This section...'.
                  Return raw plain text only. Content: #{self.raw_content}"
        }
      ]
    })
    self.description = description_response["choices"][0]["message"]["content"]

    # Create a summary of materials
    summary_response = client.chat(parameters: {
      "model": "gpt-4o-mini",
      "messages":
      [
        {
          role: "system",
          content: "You are an expert academic tutor creating clear, structured Markdown summaries of educational materials."
        },
        {
          role: "user",
          content: "Extract and summarize the core educational concepts from the following content.
                  Your response must be in raw Markdown with no extra characters or wrapping.

                  - Begin with '### Summary' followed by a 1–4 sentence paragraph overview.
                  - For each main concept, use '####' subheadings.
                  - Do not include sections titled 'Key Concepts', 'Review Questions', or 'Lesson'.
                  - Avoid introductory or closing phrases. Just the Markdown structure and content.. Content: #{self.raw_content}"
        }
      ]
    })

    self.summary = summary_response["choices"][0]["message"]["content"]
  end

  def generate_flashcards
    return if self.raw_content.blank?

    client = OpenAI::Client.new

    flashcards_response = client.chat(parameters: {
      "model": "gpt-4o-mini",
      "messages": [
        {
          role: "system",
          content: "You are an expert educational content creator. Generate flashcards that help students learn and retain key concepts. Each flashcard should have a clear question and a concise answer. Return ONLY valid JSON - no markdown formatting, no code blocks, no explanations."
        },
        {
          role: "user",
          content: "Based on the following study material content, create 10 flashcards that cover the most important concepts.
                   Return ONLY a JSON array with objects containing 'question' and 'answer' fields.
                   Questions should be clear and specific. Answers should be concise but complete.
                   Do not wrap the JSON in markdown code blocks.

                   Material Content: #{self.raw_content}"
        }
      ]
    })

    begin
      # Get the response content
      response_content = flashcards_response["choices"][0]["message"]["content"]

      # Clean up the response by removing markdown code blocks
      cleaned_content = response_content.gsub(/```json\n?/, '').gsub(/```\n?$/, '').strip

      # Parse the cleaned JSON
      flashcards_data = JSON.parse(cleaned_content)

      # Validate that we have an array
      unless flashcards_data.is_a?(Array)
        raise JSON::ParserError, "Response is not an array"
      end

      flashcards_data.each do |card|
        # Validate each card has required fields
        unless card.is_a?(Hash) && card["question"] && card["answer"]
          Rails.logger.warn "Skipping invalid flashcard: #{card}"
          next
        end

        self.flashcards.create!(
          question: card["question"],
          answer: card["answer"],
          solved: false
        )
      end

      Rails.logger.info "Successfully created #{flashcards_data.length} flashcards"

    rescue JSON::ParserError => e
      Rails.logger.error "Failed to parse flashcards JSON: #{e.message}"
      Rails.logger.error "Raw response: #{flashcards_response["choices"][0]["message"]["content"]}"

      # Fallback: create a single flashcard indicating the error
      self.flashcards.create!(
        question: "Error generating flashcards",
        answer: "Please try generating flashcards again. If the problem persists, contact support.",
        solved: false
      )
    rescue => e
      Rails.logger.error "Unexpected error generating flashcards: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")

      # Fallback for any other errors
      self.flashcards.create!(
        question: "Error generating flashcards",
        answer: "An unexpected error occurred. Please try again later.",
        solved: false
      )
    end
  end
end

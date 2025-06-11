class FlashcardsController < ApplicationController
  before_action :set_material

  def index
    @flashcards = @material.flashcards
  end

  def create
    # Generate flashcards for the material using OpenAI
    generate_flashcards_for_material

    redirect_to study_path(@material.study), notice: "Flashcards generated successfully!"
  end

  def update
    @flashcard = @material.flashcards.find(params[:id])
    if @flashcard.update(solved: params[:solved]) # params[:solved] is correctly received from JavaScript
      render json: {
        status: 'success',
        solved: @flashcard.solved,
        flashcard_id: @flashcard.id
      }
    else
      render json: {
        status: 'error',
        message: @flashcard.errors.full_messages.to_sentence
      }, status: :unprocessable_entity # Render appropriate error status
    end
  end

  private

  def set_material
    @material = Material.find(params[:material_id])
  end

  def generate_flashcards_for_material
    return if @material.raw_content.blank?

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
                   
                   Material Content: #{@material.raw_content}"
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
        
        @material.flashcards.create!(
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
      @material.flashcards.create!(
        question: "Error generating flashcards",
        answer: "Please try generating flashcards again. If the problem persists, contact support.",
        solved: false
      )
    rescue => e
      Rails.logger.error "Unexpected error generating flashcards: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      
      # Fallback for any other errors
      @material.flashcards.create!(
        question: "Error generating flashcards",
        answer: "An unexpected error occurred. Please try again later.",
        solved: false
      )
    end
  end
end
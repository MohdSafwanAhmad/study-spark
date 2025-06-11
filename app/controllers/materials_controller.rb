class MaterialsController < ApplicationController
  before_action :set_study

  def index
    @study = Study.find(params[:study_id])
    @materials = @study.materials
  end

  def create
    @material = Material.new
    @material.study = @study

    file = params[:material][:file].tempfile

    reader = PDF::Reader.new(file)
    # Read all pages and concatenate text
    all_text = ""
    reader.pages.each do |page|
      all_text += page.text + "\n"
    end

    # Truncate to 3000 characters if needed
    @material.raw_content = all_text.length > 3000 ? all_text[0, 3000] : all_text


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
                  Return only the title as raw plain text, with each word capitalized and separated by spaces.. Content: #{@material.raw_content}"
        }
      ]
    })
    @material.name = title_response["choices"][0]["message"]["content"]

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
                  Return raw plain text only. Content: #{@material.raw_content}"
        }
      ]
    })
    @material.description = description_response["choices"][0]["message"]["content"]

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
                  - Avoid introductory or closing phrases. Just the Markdown structure and content.. Content: #{@material.raw_content}"
        }
      ]
    })
    
    @material.summary = summary_response["choices"][0]["message"]["content"]


    if @material.save
      redirect_to study_path(@study), notice: "Material uploaded successfully!"
    else
      redirect_to study_path(@study), alert: "Failed to upload material. Please try again."
    end
  end

  private

  def set_study
    @study = Study.find(params[:study_id])
  end

  def material_params
    params.require(:material).permit(:name, :description, :summary, :file, :raw_content)
  end
end

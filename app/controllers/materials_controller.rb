class MaterialsController < ApplicationController
  before_action :set_study

  def index
    @study = Study.find(params[:study_id])
    @materials = @study.materials
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.study = @study

    file = params[:material][:file].tempfile

    reader = PDF::Reader.new(file)
    first_page = reader.pages.first
    content = first_page.text
    # Make a call to OpenAI to get the summary of the PDF
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])
    response = client.chat(parameters: {
      "model": "gpt-4o-mini",
      "messages": 
      [
        {
          role: "system", 
          content: "You are an expert academic tutor creating comprehensive study materials. Your task is to analyze educational content and create well-structured, engaging summaries that help students learn effectively. Format your responses with clear headings, bullet points, and key concepts highlighted."
        },
        {
          role: "user",
          content: "Extract and summarize only the core educational concepts from the following educational content. Present the summary in raw Markdown.

            Identify the main concepts discussed in the content. For each main concept, provide a clear, concise explanation and relevant examples if present in the text. Break down main concepts into sub-concepts if appropriate.

            Ensure no introductory text, wrap-up phrases, or external references (like lesson numbers or review questions) are included. The entire output must be purely the concept summary in Markdown.

            Content: #{content}"
        }
      ]
    })
    
    @material.summary = response["choices"][0]["message"]["content"]


    if @material.save
      redirect_to study_path(@study), notice: "Material uploaded successfully!"
    else
      render :new
    end
  end

  private

  def set_study
    @study = Study.find(params[:study_id])
  end

  def material_params
    params.require(:material).permit(:name, :description, :summary, :file)
  end
end

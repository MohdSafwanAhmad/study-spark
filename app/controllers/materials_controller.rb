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
    client = OpenAI::Client.new
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
                    content: "Could you extract the concepts from the following content and create a summary of the concepts as the Raw Markdown with no text around it and no code block? The idea is to help the learner understand the core concepts presented directly or with examples in the PDF. The whole summary should make sense when read together. Content: #{content}"
        }
      ]
    })
    
    @material.summary = response["choices"][0]["message"]["content"]


    if @material.save
      redirect_to study_materials_path(@study), notice: "Material uploaded successfully!"
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

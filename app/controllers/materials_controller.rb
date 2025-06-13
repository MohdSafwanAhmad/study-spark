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
    @material.process_file(file)

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

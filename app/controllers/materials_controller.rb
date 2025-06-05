class MaterialsController < ApplicationController
  def index
    @study = Study.find(params[:study_id])
    @materials = @study.materials
  end

  def new
    @study = Study.find(params[:study_id])
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.study = @study

    if @material.save
      redirect_to study_materials_path(@study), notice: "Material uploaded successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def material_params
    params.require(:material).permit(:name, :description, :summary)
  end
end

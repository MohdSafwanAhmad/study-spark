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
    params.require(:material).permit(:name, :description, :summary)
  end
end

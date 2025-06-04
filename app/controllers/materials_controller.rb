class MaterialsController < ApplicationController
  def index
    @study = Study.find(params[:study_id])
    @materials = @study.materials
  end
end

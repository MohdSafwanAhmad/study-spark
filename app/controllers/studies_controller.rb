class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end

  def new
    @study = Study.new(subject_id: params[:subject_id])
  end

  def create
    @study = Study.new(study_params)
    @study.user = current_user

    if @study.save
      redirect_to dashboard_path, notice: "Subject added to your studies!"
    else
      render :new
    end
  end

  private

  def study_params
    params.require(:study).permit(:learning_objective, :subject_id, :grade_level, course_materials: [])
  end
end

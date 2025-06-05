class StudiesController < ApplicationController
  def dashboard
    @studies = Study.includes(:subject).where(user: current_user)
  end
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
      redirect_to mysubjects_path, notice: "Subject added to your studies!"
    else
      render :new
    end
  end

  private

  def study_params
    params.require(:study).permit(:learning_objective, :subject_id, :grade_level)
  end
end

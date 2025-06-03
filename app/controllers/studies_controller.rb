class StudiesController < ApplicationController
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
    params.require(:study).permit(:subject_id, :learning_objectives)
  end
end

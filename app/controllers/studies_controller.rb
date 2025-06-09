class StudiesController < ApplicationController

  before_action :set_study, only: %i[show]
  def dashboard
    @studies = Study.includes(:subject).where(user: current_user)
  end

  def index
    @studies = Study.all
  end

  def show
    # @study is set by before_action
    @materials = @study.materials.with_attached_file
    @assigned_tutor = @study.tutoring_sessions.last&.expertise&.user
    if @assigned_tutor
      @available_tutors = []
    else
      @available_tutors = User.joins(:expertises)
                             .where(tutor: true, expertises: { subject_id: @study.subject_id })
                             .includes(:expertises)
                             .distinct
    end
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
    params.require(:study).permit(:learning_objective, :subject_id, :grade_level)
  end

  def set_study
    @study = Study.find_by(id: params[:id]) # Use find_by to avoid raising ActiveRecord::RecordNotFound
    # You might also want to add a redirect if the study is not found
    unless @study
      flash[:alert] = "Study not found."
      redirect_to dashboard_path # Redirect to a safe page if study doesn't exist
    end
  end
end

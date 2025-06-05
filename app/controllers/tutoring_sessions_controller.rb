class TutoringSessionsController < ApplicationController
  def index
    @tutors = User.tutors
    # @tutors = User.tutors.joins(:expertises).distinct

    # if params[:subject_id].present? && params[:max_price].present?
    #   @tutors = @tutors.joins(:expertises)
    #     .where(expertises: { subject_id: params[:subject_id] })
    #     .where('expertises.tutor_rate <= ?', params[:max_price])
    #     .distinct
    # elsif params[:subject_id].present?
    #   @tutors = @tutors.joins(:expertises)
    #     .where(expertises: { subject_id: params[:subject_id] })
    #     .distinct
    # elsif params[:max_price].present?
    #   @tutors = @tutors.joins(:expertises)
    #     .where('expertises.tutor_rate <= ?', params[:max_price])
    #     .distinct
    # end
  end

  def show
    @tutor = User.find(params[:id])
  end

  def new
    @tutor = User.find(params[:tutor_id])
    learner_subject_ids = current_user.study_subjects.pluck(:id)
    @expertises = @tutor.expertises.where(subject_id: learner_subject_ids)
    @tutoring_session = TutoringSession.new
  end

  def create
    expertise = Expertise.find(params[:tutoring_session][:expertise_id])
    study = current_user.studies.find_by(subject_id: expertise.subject_id)

    time_str = params[:tutoring_session][:time]
    start_time = Time.zone.parse("#{Date.today} #{time_str}")

    @tutoring_session = TutoringSession.new(
      expertise_id: expertise.id,
      study_id: study&.id,
      start_time: start_time
    )

    if @tutoring_session.save
      redirect_to root_path, notice: "Session booked!"
    else
      flash.now[:alert] = "Could not book session."
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:expertise_id, :time)
  end

end

class SessionsController < ApplicationController
  def new
    @tutor = User.find(params[:tutor_id])
    learner_subject_ids = current_user.study_subjects.pluck(:id)
    @expertises = @tutor.expertises.where(subject_id: learner_subject_ids)
    @session = Session.new
  end

  def create
    expertise = Expertise.find(params[:session][:expertise_id])
    study = current_user.studies.find_by(subject_id: expertise.subject_id)

    time_str = params[:session][:time]
    start_time = Time.zone.parse("#{Date.today} #{time_str}")

    @session = Session.new(
      expertise_id: expertise.id,
      study_id: study&.id,
      start_time: start_time
    )

    if @session.save
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

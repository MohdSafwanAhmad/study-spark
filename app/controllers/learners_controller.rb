class LearnersController < ApplicationController
  def index
    @tutoring_sessions = TutoringSession
      .includes(study: [:user, :subject, :materials])
      .where(expertise_id: current_user.expertises.pluck(:id))
  end

  def show
    @learner = User.find(params[:id])

    unless TutoringSession.joins(:study).where(expertise_id: current_user.expertise_ids, studies: { user_id: @learner.id }).exists?
      redirect_to tutor_path(current_user), alert: "Access denied to this learner profile."
    end
  end
end

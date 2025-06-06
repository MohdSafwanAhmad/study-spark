class LearnersController < ApplicationController
  def index
    @tutoring_sessions = TutoringSession
      .includes(study: [:user, :subject, :materials])
      .where(expertise_id: current_user.expertises.pluck(:id))
  end
end

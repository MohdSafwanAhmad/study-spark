class TutorsController < ApplicationController
  def index
    @tutors = User.tutors

    if params[:subject_id] == "my_subjects" && user_signed_in?
      learner_subject_ids = current_user.study_subjects.pluck(:id)
      @tutors = @tutors.joins(:expertises).where(expertises: { subject_id: learner_subject_ids }).distinct
    elsif params[:subject_id].present? && params[:subject_id] != ""
      @tutors = @tutors.joins(:expertises).where(expertises: { subject_id: params[:subject_id] })
    end

    # if params[:max_price].present?
    #   @tutors = @tutors.joins(:expertises).where('expertises.tutor_rate <= ?', params[:max_price])
    # end
    
  #   # Sorting by price
  #   if params[:sort] == "price_desc"
  #     @tutors = @tutors
  #       .joins(:expertises)
  #       .select('users.*, MAX(expertises.tutor_rate) AS max_rate')
  #       .group('users.id')
  #       .order('max_rate DESC')
  #   elsif params[:sort] == "price_asc"
  #     @tutors = @tutors
  #       .joins(:expertises)
  #       .select('users.*, MAX(expertises.tutor_rate) AS max_rate')
  #       .group('users.id')
  #       .order('max_rate ASC')
  #   end
  end

  def show
    @tutor = User.find(params[:id])
  end

  def learners
    # Find all sessions where current_user is the tutor
    @sessions = TutoringSession.joins(:expertise)
      .where(expertises: { user_id: current_user.id })
      .includes(study: [:user, :subject, :materials])
  end
end

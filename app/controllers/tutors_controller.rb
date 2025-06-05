class TutorsController < ApplicationController
  def index
    @tutors = User.tutors

    # if user_signed_in? && current_user.study_subjects.any?
    #   learner_subject_ids = current_user.study_subjects.pluck(:id)
    #   @tutors = @tutors.joins(:expertises)
    #                    .where(expertises: { subject_id: learner_subject_ids })
    #                    .distinct
    # end

  #   if params[:subject_id].present?
  #     @tutors = @tutors.joins(:expertises).where(expertises: { subject_id: params[:subject_id] })
  #   end

  #   if params[:max_price].present?
  #     @tutors = @tutors.joins(:expertises).where('expertises.tutor_rate <= ?', params[:max_price])
  #   end
  end
end

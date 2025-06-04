class TutorsController < ApplicationController
  def index
    @tutors = User.tutors.joins(:expertises).distinct

    if params[:subject_id].present? && params[:max_price].present?
      @tutors = @tutors.joins(:expertises)
        .where(expertises: { subject_id: params[:subject_id] })
        .where('expertises.tutor_rate <= ?', params[:max_price])
        .distinct
    elsif params[:subject_id].present?
      @tutors = @tutors.joins(:expertises)
        .where(expertises: { subject_id: params[:subject_id] })
        .distinct
    elsif params[:max_price].present?
      @tutors = @tutors.joins(:expertises)
        .where('expertises.tutor_rate <= ?', params[:max_price])
        .distinct
    end
  end

  def show
    @tutor = User.find(params[:id])
  end
end

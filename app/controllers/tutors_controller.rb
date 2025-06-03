class TutorsController < ApplicationController
  def index
    @tutors = User.tutors.joins(:expertises).distinct
  end

  def show
    @tutor = User.find(params[:id])
  end
end

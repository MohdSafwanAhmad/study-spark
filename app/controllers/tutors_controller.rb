class TutorsController < ApplicationController
  def index
    @tutors = User.tutors
  end

  def show
    @tutor = User.find(params[:id])
  end
end

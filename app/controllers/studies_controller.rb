class StudiesController < ApplicationController
  def mysubjects
    @studies = Study.includes(:subject).where(user: current_user)
  end
end

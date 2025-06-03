class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def mysubjects
    @subjects = current_user.subjects.distinct
  end
end

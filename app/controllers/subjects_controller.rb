class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to new_study_path(subject_id: @subject.id), notice: "Subject created!"
    else
      render :new
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end

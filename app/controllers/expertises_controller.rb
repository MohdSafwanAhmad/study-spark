class ExpertisesController < ApplicationController
  def new
    @expertises = current_user.expertises
    @tutor = current_user
    @tutor.expertises.build if @tutor.expertises.empty?
    @expertise = Expertise.new
  end

  def create
    @tutor = current_user
    @expertise = Expertise.new(expertise_params)
    @expertise.user = current_user
    @expertises = current_user.expertises


    if @expertise.save
      redirect_to new_expertise_path, notice: "Expertise saved successfully!"
    else
      render :new
    end
  end

  def new_field
    @index = params[:index].to_i
    render partial: "expertises/expertise_fields", locals: { index: @index }
  end

  private


  def expertise_params
    params.require(:expertise).permit(:subject_id, :tutor_rate)
  end
end

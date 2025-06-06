class ExpertisesController < ApplicationController
  def new
    @tutor = current_user
    @tutor.expertises.build if @tutor.expertises.empty?
  end

  def create
    @tutor = current_user
    if @tutor.update(tutor_params)
      redirect_to dashboard_path, notice: "Expertise saved successfully!"
    else
      @tutor.expertises.build if @tutor.expertises.empty?
      render :new
    end
  end

  private

  def tutor_params
    params.require(:user).permit(
      expertises_attributes: [:id, :subject_id, :tutor_rate, :_destroy]
    )
  end
end

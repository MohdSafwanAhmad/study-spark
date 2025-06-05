class ExpertisesController < ApplicationController
  def index
    @tutor = current_user
  end

  def new
    @tutor = current_user
    @tutor.expertises.build if @tutor.expertises.empty?
  end

  def create
    @tutor = current_user
    if @tutor.update(tutor_params)
      redirect_to dashboard_path, notice: "Your tutor profile has been created!"
    else
      render :new
    end
  end

  private

  def ensure_tutor!
    redirect_to root_path, alert: "Access denied" unless current_user.tutor?
  end

  def tutor_params
    params.require(:user).permit(tutor_profile_attributes: [:id, :name, :bio, :experience])
  end
end

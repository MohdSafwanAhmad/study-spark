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
      redirect_to tutor_path(@tutor), notice: "Expertise saved successfully!"
    else
      @tutor.expertises.build if @tutor.expertises.empty?
      render :new
    end
  end

  def edit
    @expertise = current_user.expertises.find(params[:id])
    redirect_to tutor_path(current_user, edit_id: @expertise.id)
  end

  def update
  @expertise = current_user.expertises.find(params[:id])

  respond_to do |format|
    if @expertise.update(expertise_params)
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "expertise_#{@expertise.id}",
          # Render inline HTML (you can use a helper or inline ERB)
          partial: "expertises/full_expertise", # or inline render with locals if you want
          locals: { expertise: @expertise }
        )
      end
      format.html { redirect_to tutor_path(current_user), notice: "Expertise updated successfully!" }
    else
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
  "expertise_#{@expertise.id}",
  partial: "expertises/edit_form",   # <-- your actual partial filename
  locals: { expertise: @expertise }
)

      end
      format.html { redirect_to tutor_path(current_user, edit_id: @expertise.id), alert: "Update failed" }
    end
   end
  end


  def destroy
    @expertise = current_user.expertises.find(params[:id])
    @expertise.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to tutor_path(current_user), notice: "Expertise deleted." }
    end
  end

  private

  def expertise_params
    params.require(:expertise).permit(:subject_id, :tutor_rate)
  end
end

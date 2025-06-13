class FlashcardsController < ApplicationController
  before_action :set_material

  def index
    @flashcards = @material.flashcards
  end

  def create
    # Generate flashcards for the material using OpenAI
    @material.generate_flashcards

    redirect_to study_path(@material.study), notice: "Flashcards generated successfully!"
  end

  def update
    @flashcard = @material.flashcards.find(params[:id])
    if @flashcard.update(solved: params[:solved]) # params[:solved] is correctly received from JavaScript
      render json: {
        status: 'success',
        solved: @flashcard.solved,
        flashcard_id: @flashcard.id
      }
    else
      render json: {
        status: 'error',
        message: @flashcard.errors.full_messages.to_sentence
      }, status: :unprocessable_entity # Render appropriate error status
    end
  end

  private

  def set_material
    @material = Material.find(params[:material_id])
  end
end
class Study < ApplicationRecord
  attr_accessor :grade_level
  belongs_to :user
  belongs_to :subject
  has_many :materials
  has_many :tutoring_sessions
  has_many :chats, dependent: :destroy


  def flashcards_done
    materials.sum { |material| material.flashcards.solved.count }
  end

  def flashcards_total
    materials.sum { |material| material.flashcards.count  }
  end

  def progress
    if flashcards_total == 0
      0
    else
      (flashcards_done.to_f / flashcards_total.to_f * 100).to_i
    end
  end

  def current_tutor
    tutoring_sessions.includes(expertise: :user).last&.expertise&.user
  end
end

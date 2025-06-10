class Flashcard < ApplicationRecord
  belongs_to :material

  validates :question, presence: true
  validates :answer, presence: true

  scope :solved, -> { where(solved: true) }
  scope :unsolved, -> { where(solved: false) }
end
class Material < ApplicationRecord
  belongs_to :study
  attr_accessor :file
  has_many :flashcards, dependent: :destroy
  validates :raw_content, presence: true, length: { maximum: 10000 }
end

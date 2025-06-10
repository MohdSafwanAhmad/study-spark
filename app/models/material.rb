class Material < ApplicationRecord
  belongs_to :study
  attr_accessor :file
  has_many :flashcards, dependent: :destroy
end

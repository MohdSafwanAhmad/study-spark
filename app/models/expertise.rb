class Expertise < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :tutoring_sessions
  validates :tutor_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
end

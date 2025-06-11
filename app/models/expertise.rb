class Expertise < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :tutoring_sessions
  # validates :tutor_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  def rate_in_dollars
    tutor_rate.to_f / 100 if tutor_rate
  end
end

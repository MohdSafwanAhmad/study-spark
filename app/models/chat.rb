class Chat < ApplicationRecord
  belongs_to :study
  has_one :user, through: :study

  validates :user_question, presence: true
  after_create :fetch_ai_answer

  private

  def fetch_ai_answer
    ChatbotJob.perform_later(self)
  end
end

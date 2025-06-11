class Chat < ApplicationRecord
  belongs_to :study
  belongs_to :user

  validates :user_question, presence: true
  after_create :fetch_ai_answer

  after_create_commit do
    broadcast_append_to "chats_study_#{study_id}", target: "chats"
  end

  private

  def fetch_ai_answer
    ChatbotJob.perform_later(self)
  end
end

class ChatbotMessage < ApplicationRecord
  belongs_to :studies
  belongs_to :users, through: :studies

  validates :user_question, presence: true
end

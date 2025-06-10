class ChatbotMessagesController < ApplicationController
  def index
    @questions = current_user.chatbot_messages
    @question = Question.new
  end
end

class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(chat)
    @chat = chat
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: messages_for_openai
      }
    )

    new_content = chatgpt_response["choices"][0]["message"]["content"]

    chat.update(ai_answer: new_content)

    Turbo::StreamsChannel.broadcast_update_to(
      "chat_#{chat.id}",
      target: "chat_#{chat.id}",
      partial: "chats/chat",
      locals: { chat: chat }
    )
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def messages_for_openai
    chats = @chat.study.chats.order(:created_at)
    results = []
    results << { role: "system", content: "You are a helpful tutor assistant." }

    chats.each do |chat|
      results << { role: "user", content: chat.user_question }
      results << { role: "assistant", content: chat.ai_answer || "" }
    end

    results
  end
end

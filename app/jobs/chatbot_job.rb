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

    system_prompt = "You are Sparky, a friendly and knowledgeable study assistant here to help a student with #{@chat.study.subject.name}.

    This student’s current learning objective is: #{@chat.study.learning_objective}. Keep this goal in mind as you support them — tailor your answers to help them make progress toward it.

    Use your subject expertise along with the material summaries below to support the student's learning. Be encouraging, clear, and easy to understand. Your goal is to help the student feel confident while building knowledge.

    If the student has not uploaded any materials yet, gently suggest they click on #{@chat.study.subject.name} in the sidebar and click on the Upload New Material button so you can provide more targeted help.

    When responding:
    - Keep answers to 3 to 4 well-structured sentences
    - If the question requires a longer explanation, ask the student if they'd like you to expand
    - Use correct punctuation, spacing, and line breaks
    - Format responses clearly using:
      - Bullet points when helpful
      - Emojis when appropriate to make the message more engaging
    - Do not use markdown formatting (no asterisks, hashes, or symbols for styling)"

    @chat.study.materials.each do |material|
      system_prompt += "\nMaterial: #{material.name}\nSummary: #{material.summary}\n"
    end

    results << { role: "system", content: system_prompt.strip }

    chats.each do |chat|
      results << { role: "user", content: chat.user_question }
      results << { role: "assistant", content: chat.ai_answer || "..." }
    end

    results
  end
end

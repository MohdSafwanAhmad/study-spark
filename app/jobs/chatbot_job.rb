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

    chat.update!(ai_answer: new_content)

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

    student = @chat.user
    student_age = if student.date_of_birth.present?
      ((Date.today - student.date_of_birth.to_date).to_i / 365.25).floor
    else
      "unknown age"
    end

    # Find most recent tutor via tutoring sessions
    latest_tutor = @chat.study.tutoring_sessions
                          .includes(expertise: :user)
                          .order(created_at: :desc)
                          .map { |s| s.expertise.user }
                          .first
    tutor_phrase =
      if latest_tutor.present?
        "Their assigned tutor is #{latest_tutor.first_name}. Refer to the tutor when helpful, but avoid repeating what would typically be covered in a live session."
      else
        "There is no assigned tutor at the moment. Be especially supportive and thorough in your explanations, as you may be their main guide for now."
      end

    # === SYSTEM PROMPT ===
    system_prompt = ""

    # [Profile]
    system_prompt += "[Profile]\n"
    system_prompt += "You are Sparky, a friendly and knowledgeable study assistant helping a student with #{@chat.study.subject.name}.\n"
    system_prompt += "The student is #{student_age}, which may affect how you explain concepts.\n"
    system_prompt += "The student's current learning objective is: \"#{@chat.study.learning_objective}\".\n"
    system_prompt += "#{tutor_phrase}\n\n"

    # [Materials]
    if @chat.study.materials.any?
      system_prompt += "[Materials]\n"
      system_prompt += "Below are summaries of materials the student has uploaded. You can refer to them by name or content to support your answers.\n\n"
      @chat.study.materials.each do |material|
        system_prompt += "Material: #{material.name}\n"
        system_prompt += "Summary: #{material.summary}\n\n"
      end
    else
      system_prompt += "[Materials]\n"
      system_prompt += "The student has not uploaded any materials yet. Suggest they click on #{@chat.study.subject.name} in the sidebar and select \"Upload New Material\" to get more tailored help.\n\n"
    end

    # [Tone & Style]
    system_prompt += "[Tone & Style]\n"
    system_prompt += "- Use a supportive, encouraging tone — like a thoughtful tutor.\n"
    system_prompt += "- Be clear and relatable in your explanations.\n"
    system_prompt += "- Avoid sounding robotic or overly formal.\n"
    system_prompt += "- Use emojis when helpful to keep responses engaging.\n"
    system_prompt += "- Do not use markdown formatting (no asterisks, hashes, or symbols for styling).\n\n"

    # [Answer Guidelines]
    system_prompt += "[Answer Guidelines]\n"
    system_prompt += "- Keep answers to 3–4 well-structured sentences.\n"
    system_prompt += "- If the question needs more depth, ask the student if they'd like you to expand.\n"
    system_prompt += "- Format responses clearly using:\n"
    system_prompt += "  • Bullet points for lists\n"
    system_prompt += "  • Line breaks between ideas\n"
    system_prompt += "- For summaries: use 3–5 concise bullet points.\n"
    system_prompt += "- For concepts: give a short definition, one example, and optionally ask a follow-up question.\n\n"

    # [Safety & Boundaries]
    system_prompt += "[Safety & Boundaries]\n"
    system_prompt += "- Do not provide medical, legal, or personal advice.\n"
    system_prompt += "- If the student asks something sensitive or non-academic, suggest involving their tutor or a trusted adult.\n"
    system_prompt += "- If you don’t know the answer, say so clearly and recommend asking the tutor or checking a reliable source.\n"

    results << { role: "system", content: system_prompt.strip }

    # Add chat history
    chats.each do |chat|
      results << { role: "user", content: chat.user_question }
      results << { role: "assistant", content: chat.ai_answer || "" }
    end

    results
  end
end

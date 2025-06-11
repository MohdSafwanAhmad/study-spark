class AddAiPromptToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :ai_prompt, :boolean
  end
end

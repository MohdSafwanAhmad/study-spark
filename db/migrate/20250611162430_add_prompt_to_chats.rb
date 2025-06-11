class AddPromptToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :prompt, :boolean
  end
end

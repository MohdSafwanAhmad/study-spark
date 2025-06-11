class AddToAiToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :to_ai, :boolean
  end
end

class AddSenderToChats < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :user, index: true, foreign_key: true
  end
end

class CreateChatbotMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :chatbot_messages do |t|
      t.text :user_question
      t.string :ai_response
      t.string :text
      t.references :study, null: false, foreign_key: true

      t.timestamps
    end
  end
end

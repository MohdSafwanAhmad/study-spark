class CreateFlashcards < ActiveRecord::Migration[7.1]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.string :answer
      t.boolean :solved
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end

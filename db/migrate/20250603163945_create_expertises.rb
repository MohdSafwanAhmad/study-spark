class CreateExpertises < ActiveRecord::Migration[7.1]
  def change
    create_table :expertises do |t|
      t.decimal :tutor_rate
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end

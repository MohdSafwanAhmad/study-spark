class CreateTutoringSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :tutoring_sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :expertise, null: false, foreign_key: true
      t.references :study, null: false, foreign_key: true

      t.timestamps
    end
  end
end

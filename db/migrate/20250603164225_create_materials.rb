class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.string :format
      t.string :summary
      t.references :study, null: false, foreign_key: true

      t.timestamps
    end
  end
end

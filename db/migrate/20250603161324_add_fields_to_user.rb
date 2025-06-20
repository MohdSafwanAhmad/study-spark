class AddFieldsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tutor, :boolean
    add_column :users, :date_of_birth, :datetime
    add_column :users, :bio, :string
  end
end

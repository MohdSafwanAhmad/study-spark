class AddRawContentToMaterial < ActiveRecord::Migration[7.1]
  def change
    add_column :materials, :raw_content, :text
  end
end
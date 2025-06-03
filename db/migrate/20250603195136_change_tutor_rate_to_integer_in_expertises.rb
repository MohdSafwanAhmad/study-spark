class ChangeTutorRateToIntegerInExpertises < ActiveRecord::Migration[7.1]
  def change
    change_column :expertises, :tutor_rate, :integer
  end
end

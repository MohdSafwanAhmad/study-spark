class Subject < ApplicationRecord
  has_many :studies
  has_many :users, through: :studies
  has_many :users, through: :expertises
end

class Study < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :materials
end

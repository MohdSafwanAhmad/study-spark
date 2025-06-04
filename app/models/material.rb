class Material < ApplicationRecord
  belongs_to :study
  has_one_attached(:file)
end

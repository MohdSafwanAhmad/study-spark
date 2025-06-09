class Material < ApplicationRecord
  belongs_to :study
  attr_accessor :file
end

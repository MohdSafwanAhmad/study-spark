class Study < ApplicationRecord
  attr_accessor :grade_level
  belongs_to :user
  belongs_to :subject
end

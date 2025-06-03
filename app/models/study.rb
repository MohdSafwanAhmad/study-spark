class Study < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many_attached :course_materials
end

class TutoringSession < ApplicationRecord
  belongs_to :expertise
  belongs_to :study

  delegate :user, to: :expertise, prefix: true
end

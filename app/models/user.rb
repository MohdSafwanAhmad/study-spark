class User < ApplicationRecord
  has_many :expertises
  has_many :expertise_subjects, through: :expertises, source: :subject

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :studies
  has_many :study_subjects, through: :studies, source: :subject

  scope :tutors, -> { where(tutor: true) }
end

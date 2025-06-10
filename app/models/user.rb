class User < ApplicationRecord
  has_many :expertises, dependent: :destroy
  has_many :expertise_subjects, through: :expertises, source: :subject
  accepts_nested_attributes_for :expertises, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :studies
  has_many :study_subjects, through: :studies, source: :subject
  has_many :chatbot_messages, through: :studies

  scope :tutors, -> { where(tutor: true) }
end

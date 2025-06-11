class User < ApplicationRecord
  has_one_attached :profile_picture
  has_many :expertises, dependent: :destroy
  has_many :expertise_subjects, through: :expertises, source: :subject
  accepts_nested_attributes_for :expertises, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :studies
  has_many :chats, through: :studies

  has_many :study_subjects, through: :studies, source: :subject

  scope :tutors, -> { where(tutor: true) }
end

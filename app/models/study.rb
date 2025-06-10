class Study < ApplicationRecord
  attr_accessor :grade_level
  belongs_to :user
  belongs_to :subject
  has_many :materials
  has_many :tutoring_sessions
  has_many :chatbot_messages

  def fake_percent_complete
    require 'zlib'
    ((Zlib.crc32(id.to_s) % 71) + 20)
  end
end

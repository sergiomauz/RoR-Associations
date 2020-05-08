class Event < ApplicationRecord
  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date <= ?', Time.now) }

  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: 'attended_event_id', class_name: 'Attendance'
  has_many :attendees, through: :attendances
end

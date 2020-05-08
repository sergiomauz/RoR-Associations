class User < ApplicationRecord
  def prev_events
    attended_events.where('date <= ?', Time.now)
  end

  def upcoming_events
    attended_events.where('date > ?', Time.now)
  end

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attendances, foreign_key: 'attendee_id', class_name: 'Attendance'
  has_many :attended_events, through: :attendances
end

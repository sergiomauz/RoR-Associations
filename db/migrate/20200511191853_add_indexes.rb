class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :creator_id
    add_index :attendances, :attended_event_id
    add_index :attendances, :attendee_id
  end
end

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :attended_event_id, null: false
      t.integer :attendee_id, null: false

      t.timestamps
    end
  end
end

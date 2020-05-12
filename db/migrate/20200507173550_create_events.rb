class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|      
      t.string :title
      t.datetime :date
      t.string :location
      t.integer :creator_id, null: false

      t.timestamps
    end    
  end
end

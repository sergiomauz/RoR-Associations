class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|      
      t.string :title
      t.datetime :date
      t.string :location
      t.references :creator, index: true, foreign_key: {to_table: :user}

      t.timestamps
    end    
  end
end

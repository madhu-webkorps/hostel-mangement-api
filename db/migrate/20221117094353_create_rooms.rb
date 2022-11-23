class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
    t.integer :seater
    t.decimal :fees 
    t.integer :room_no
    t.references :hostel

      t.timestamps
    end
  end
end

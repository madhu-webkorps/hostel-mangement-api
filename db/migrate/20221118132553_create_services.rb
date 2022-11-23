class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.boolean :food
      t.integer :electricity_charges
      t.references :hostel

      t.timestamps
    end
  end
end

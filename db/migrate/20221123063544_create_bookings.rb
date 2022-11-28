class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :contact_no
      t.string :guardian_name
      t.string :guardian_contact_no
      t.string :address
      t.integer :room_no
      t.integer :duration
      t.string :country
      t.string :organization
      t.string :addhar_no
      t.integer :room_no
      t.boolean :registration_fees ,default: false
      t.boolean :coation_mony, default: false
      t.timestamps
    end
  end
end

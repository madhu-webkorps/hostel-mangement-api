class CreateHostels < ActiveRecord::Migration[5.1]
  def change
    create_table :hostels do |t|
      t.string :name
      t.string :location
      t.references :user
      t.timestamps
    end
  end
end

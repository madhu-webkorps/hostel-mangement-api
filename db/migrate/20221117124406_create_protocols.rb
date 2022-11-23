class CreateProtocols < ActiveRecord::Migration[5.1]
  def change
    create_table :protocols do |t|
     
      t.string :discription
      t.references :hostel
      t.timestamps
    end
  end
end

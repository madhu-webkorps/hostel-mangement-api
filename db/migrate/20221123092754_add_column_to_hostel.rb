class AddColumnToHostel < ActiveRecord::Migration[5.1]
  def change
    add_column :hostels, :about, :text
  end
end

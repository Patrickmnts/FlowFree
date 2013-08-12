class CreateRiverTimes < ActiveRecord::Migration
  def change
    create_table :river_times  do |t|
      t.string :site_code
      t.datetime :time
      t.integer :cfs_value

      t.timestamps
    end
    add_index :river_times, :site_code
    add_index :river_times, :time
  end
end

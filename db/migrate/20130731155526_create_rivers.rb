class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :site_name
      t.string :site_code
      t.datetime :refresh_time
      t.string :latitude
      t.string :longitude
      t.string :srs
      t.string :county_id
      t.string :cfs_value
      t.string :state

      t.timestamps
    end
  end
end

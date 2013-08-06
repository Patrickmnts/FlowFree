class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :site_name
      t.string :site_code
      t.string :latitude
      t.string :longitude
      t.string :county_id
      t.string :state

      t.timestamps
    end
    add_index :site_code, unique: true
  end
end

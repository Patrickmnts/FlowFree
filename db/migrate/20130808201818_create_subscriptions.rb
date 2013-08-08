class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.string :site_code
      t.integer :ceiling
      t.integer :floor

      t.timestamps
    end
  end
end


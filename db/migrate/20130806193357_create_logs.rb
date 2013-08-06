class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :message

      t.timestamps
    end
  end
end

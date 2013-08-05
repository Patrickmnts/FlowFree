class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|

      t.timestamps
    end
  end
end

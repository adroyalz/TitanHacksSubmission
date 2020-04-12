class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.integer :cases
      t.integer :deaths

      t.timestamps
    end
  end
end

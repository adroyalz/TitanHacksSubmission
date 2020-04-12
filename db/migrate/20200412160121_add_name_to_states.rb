class AddNameToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :Name, :string
  end
end

class AddOwnerToStalls < ActiveRecord::Migration[5.2]
  def change
    add_column :stalls, :owner, :string
  end
end

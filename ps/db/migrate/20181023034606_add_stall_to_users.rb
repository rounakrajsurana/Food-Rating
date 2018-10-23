class AddStallToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stall, :boolean
  end
end

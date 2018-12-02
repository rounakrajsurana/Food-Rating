class AddAddressToStalls < ActiveRecord::Migration[5.2]
  def change
    add_column :stalls, :address, :string
  end
end

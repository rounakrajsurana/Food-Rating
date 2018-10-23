class AddContactnoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contactno, :string
  end
end

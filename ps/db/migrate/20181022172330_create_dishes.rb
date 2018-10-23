class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :desc
      t.string :picture
      t.references :category, foreign_key: true
      t.references :stall, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

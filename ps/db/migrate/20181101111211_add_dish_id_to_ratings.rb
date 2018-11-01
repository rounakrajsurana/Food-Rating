class AddDishIdToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :dish_id, :integer
  end
end

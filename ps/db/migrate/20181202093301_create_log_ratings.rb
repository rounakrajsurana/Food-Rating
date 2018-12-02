class CreateLogRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :log_ratings do |t|
      t.integer :rating_id
      t.integer :rate
      t.string :comment
      t.references :dish, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

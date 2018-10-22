class CreateStalls < ActiveRecord::Migration[5.2]
  def change
    create_table :stalls do |t|
      t.string :name
      t.string :desc
      t.string :picture
      t.string :latlog
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

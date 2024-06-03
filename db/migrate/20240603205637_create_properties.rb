class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.string :country
      t.decimal :price_per_night
      t.integer :capacity

      t.timestamps
    end
  end
end

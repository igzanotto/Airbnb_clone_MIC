class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :title, null: false
      t.string :category
      t.integer :number_of_guests, default: 1
      t.integer :price, null: false
      t.string :location
      t.boolean :available
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

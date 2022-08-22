class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :number_of_guests, default: 1
      t.boolean :confirmed, default: false
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

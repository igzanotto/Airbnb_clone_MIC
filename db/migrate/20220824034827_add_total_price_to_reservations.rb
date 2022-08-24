class AddTotalPriceToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :total_price, :integer
  end
end

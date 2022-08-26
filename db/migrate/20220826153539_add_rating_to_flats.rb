class AddRatingToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :rating, :string
  end
end

class AddRatingsToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :ratings, :integer
  end
end

class RemoveRatingFromFlats < ActiveRecord::Migration[7.0]
  def change
    remove_column :flats, :rating, :string
  end
end

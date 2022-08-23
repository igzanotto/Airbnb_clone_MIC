class AddPictureToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :picture_url, :string
  end
end

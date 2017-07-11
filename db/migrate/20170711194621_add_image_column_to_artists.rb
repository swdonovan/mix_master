class AddImageColumnToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :image_path, :text
  end
end

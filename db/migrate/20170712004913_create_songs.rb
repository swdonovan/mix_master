class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      # t.references :artist, foreign_key: true
      t.text :title

      t.timestamps
    end
  end
end

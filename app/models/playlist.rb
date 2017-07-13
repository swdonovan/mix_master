class Playlist < ApplicationRecord
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  validates :name, presence: true, uniqueness: true
  validates_associated :playlist_songs
  validates_associated :songs
end

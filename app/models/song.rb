class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlists

  validates :title, presence: true, uniqueness: true
  validates :artist_id, presence: true

  validates_associated :playlists

end

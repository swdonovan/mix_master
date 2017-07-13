class Artist < ApplicationRecord
  has_many :songs

  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  validates_associated :songs
end

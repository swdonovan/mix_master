require 'rails_helper'

RSpec.feature "User clicks on edit button from show page" do
  it "finds a form to edit a specific artist" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    @test_artist = Artist.new(name: "Balls", image_path: artist_image_path)
    @test_artist.save
  visit("/artists/#{@test_artist.id}")
  click_on "Delete"


  expect(current_path).to eq("/artists")  
  end
end

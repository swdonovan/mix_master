require 'rails_helper'

RSpec.feature "User clicks on edit button from show page" do
  it "finds a form to edit a specific artist" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    @test_artist = Artist.new(name: "nuts", image_path: artist_image_path)
    @test_artist.save
  visit("/artists/#{@test_artist.id}")

  click_on "Edit"

  expect(page).to have_content("Edit Artist #{@test_artist.name}")
  expect(page).to have_content("Name")
  expect(page).to have_content("Image path")
  expect(page).to have_button("Update Artist")

  fill_in "artist_name", with: "Bill"
  fill_in "artist_image_path", with: artist_image_path
  click_on "Update Artist"

  expect(current_path).to eq("/artists/#{@test_artist.id}")
  expect(page).to have_content("Bill")
  expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

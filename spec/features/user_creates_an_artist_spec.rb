require 'rails_helper'

RSpec.feature "User creates a new artist using submit" do
  scenario "they enter data to create a new artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit '/'
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    expect(current_path).to eq("/artists/#{Artist.last.id}")
  end
end
# As a user
# When I visit the artists index
# And I click "New artist"
# And I fill in the name
# And I fill in an image path
# And I click "Create Artist"
# Then I should see the artist name and image on the page

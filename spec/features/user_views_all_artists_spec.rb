require 'rails_helper'

RSpec.feature "User views Home/Index page and sees all the Artists"do
  scenario "They see all the artists if theres any?" do
    Artist.create(name: "Bob", image_path: "www.google.com")
    Artist.create(name: "Homer", image_path: "www.yahoo.com")
    Artist.create(name: "Simpsonite", image_path: "www.therealsouthpark.com")

    visit '/artists'


    expect(page).to have_content Artist.first.name
    expect(page).to have_content "New Artist"
    expect(page).to have_content Artist.last.name

    click_on "New Artist"

    expect(current_path).to eq("/artists/new")
  end
end

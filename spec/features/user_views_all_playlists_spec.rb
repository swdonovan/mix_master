require 'rails_helper'

RSpec.feature "User visits Playlist Index page" do
  scenario "they see the page for all playlists" do
    song_one, song_two, song_three = create_list(:song, 3)

    visit playlists_path


    expect(page).to have_link "New playlist"
    expect(page)
  end
end

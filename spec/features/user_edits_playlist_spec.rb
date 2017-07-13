require 'rails_helper'

RSpec.feature "User wanted to edit their playlist" do
  before :each do
    @song_one, @song_two, @song_three = create_list(:song, 3)

    @playlist_name = "My Jams"

    visit playlists_path
    click_on "New playlist"
    fill_in "playlist_name", with: @playlist_name
    check("song-#{@song_one.id}")
    check("song-#{@song_three.id}")
    click_on "Create Playlist"
    @the_playlist = Playlist.last
  end
  scenario "they see the page for the playlist" do

    visit playlist_path(@the_playlist)
    click_on "Edit"
    fill_in "playlist_name", with: "Bill"
    uncheck("song-#{@song_one.id}")
    check("song-#{@song_two.id}")
    click_on "Update Playlist"

    expect(current_path).to eq playlist_path(@song_one)
    expect(page).to have_content "Bill"
    expect(page).to have_content @song
  end
end

# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song

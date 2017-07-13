class PlaylistsController < ApplicationController
  before_action :all_songs, only: [:show, :new, :edit]
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist)
    else
      render :edit
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def all_songs
    @songs = Song.all
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end

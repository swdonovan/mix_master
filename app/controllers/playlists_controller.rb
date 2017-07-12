class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @songs = Song.all
    @playlist = Playlist.find(params[:id])
  end

  def new
    @songs = Song.all
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def edit
      @playlist = Playlist.find(params[:id])
      @songs = Song.all
  end

  def update
    @playlist = Playlist.find(params[:id])
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
end

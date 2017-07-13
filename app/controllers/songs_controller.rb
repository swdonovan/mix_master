class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit]
  before_action :set_artist, only: [:new, :create]
  def index
    @songs = Songs.all
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_id)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end

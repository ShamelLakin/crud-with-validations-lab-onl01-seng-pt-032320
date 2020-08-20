class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params)
      # binding.pry
    if @song.valid?
       @song.save
      redirect_to song_path(@song)
    else
        render :new
    end
  end

  def show
    # @song = Song.find(params[:id])
  end

  def edit
    # @song = Song.find(params[:id])
  end

  def update
    # @song = Song.find(params[:id])
    @song.update(post_params)
    # binding.pry
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

    def destroy
      @song.destroy!
      redirect_to songs_path
    end
  end

  private

  def post_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

    def set_song!
      @song = Song.find(params[:id])
    end
end

class AlbumsController < ApplicationController
  
  def create
    album = Album.new(albums_param)
    if album.save
      redirect_to band_url(album)
    else
      flash.now[:errors] = album.errors.full_messages
      render :new
    end
  end

  def new

    render :new
  end

  # def edit
  #   @album = Album.find(params[:id])
  #   render :edit
  # end

  # def show
  #   @album = Album.find(params[:id])
  #   render :show
  # end

  # def update
  #   album = Album.find(params[:id])
  #   if album.update(albums_param)
  #     redirect_to band_url(album)
  #   else
  #     flash.now[:errors] = @album.errors.full_messages
  #     render :edit
  #   end
  # end

  # def destroy
  #   album = Album.find(params[:id])
  #   album.destroy
  #   redirect_to bands_url
  # end

  private

  def albums_param
    params.require(:album).permit(:title, :year, :genre, :band_id)
  end

end
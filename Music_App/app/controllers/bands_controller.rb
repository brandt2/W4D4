class BandsController < ApplicationController
  before_action :require_login, only: [:create, :new, :edit, :update, :destroy]

  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(bands_param)
    if band.save
      redirect_to band_url(band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    band = Band.find(params[:id])
    if band.update(bands_param)
      redirect_to band_url(band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to bands_url
  end

  private

  def bands_param
    params.require(:band).permit(:name)
  end

end
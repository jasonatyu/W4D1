class ArtworksController < ApplicationController
  def index 
    @artworks = User.find_by(id: params[:user_id]).artworks
    @shares = User.find_by(id: params[:user_id]).shared_artworks
    render json: {owned_art: @artworks, shared_art: @shares}, status: 200 
  end 

  def create 
    @artwork = Artwork.new(artwork_params)
    if @artwork.save 
      render json: @artwork, status: 200
    else 
      render json: @artwork.errors.full_messages, status: 418 
    end 
  end 

  def show 
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork 
      render json: @artwork, status: 200
    else 
      render json: "No artwork found.", status: 404 
    end
  end 

  def update 
    @artwork = Artwork.update(params[:id], artwork_params)
    if @artwork 
      render json: @artwork, status: 200 
    else 
      render json: @artwork.errors.full_messages, status: 404 
    end
  end 

  def destroy 
    @artwork = Artwork.destroy(params[:id])
    render json: @artwork, status: 200
  end 

  private 
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end 
end

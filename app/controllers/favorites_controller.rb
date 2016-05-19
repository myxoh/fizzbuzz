class FavoritesController < ApplicationController
  def create
    Favorite.create favorite_params
    redirect_to page_path(params[:page])
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to page_path(params[:page])
  end
  
  private
  def favorite_params
    params.require(:favorite).permit :number
  end
end

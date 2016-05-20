class FavoritesController < ApplicationController
  def create
    Favorite.create favorite_params
    redirect_to page_path(params[:page])
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to page_path(params[:page])
  end
  
  def add_primes
    FavoriteFromComplexOperationJob.perform_later params[:prime].to_i
    redirect_to page_path(params[:page]), flash: {notice: "Your process has started and will be finished soon"}
  end
  
  private
  def favorite_params
    params.require(:favorite).permit :number
  end
end

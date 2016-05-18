module Api::V1
  class FavoritesController < ApiController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy, :index] #As there is no user verification I'm not creating one for this place
    
    def create
      Favorite.create(favorite_params)
      show_all
    end
    
    def destroy
      Favorite.find(params[:id]).destroy
      show_all
    end
    
    def index
      show_all
    end
    
    private
    def show_all
      @favorites=Favorite.all.order(:number)
      render json:@favorites
    end
    
    def favorite_params
      params.require(:favorite).permit(:number)
    end

  end
end
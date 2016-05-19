require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  setup do
    @page = 0
  end
  test "should get create" do
    assert_difference 'Favorite.count', 1 do
      post :create, favorite: {number: 99}, page: @page
    end
    assert_redirected_to page_path @page
  end

  test "should get destroy" do
    page=0
    assert_difference 'Favorite.count', -1 do
      delete :destroy, id: favorites(:one), page: @page
    end
    assert_redirected_to page_path @page
  end
end

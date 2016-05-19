require 'test_helper'

class Api::V1::FavoritesControllerTest < ActionController::TestCase
 test "should get index" do
    get :index
    assert_response :success
    result = JSON.parse @response.body
    assert !result[0]["id"].nil?
    assert_equal 15, result[0]["number"]
    assert_equal "FizzBuzz", result[0]["fizzbuzz"]
    assert_equal 2, result.length
  end
  
  test "should get create" do
    assert_difference 'Favorite.count', 1 do
      post :create, favorite: {number: 99}, page: @page
    end
    assert_response :success
  end

  test "should get destroy" do
    assert_difference 'Favorite.count', -1 do
      delete :destroy, id: favorites(:one), page: @page
    end
    assert_response :success
  end
end
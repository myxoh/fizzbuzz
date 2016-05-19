require 'test_helper'

class Api::V1::NumbersControllerTest < ActionController::TestCase
 test "Should get first 100 items by default" do
    get :display, page: 0, page_size: 100
    assert_response :success
    100.times do |i|
      assert_equal i+1, assigns(:numbers)[i][:value]
    end
    assert assigns(:numbers)[100].nil?
  end

  test "should get 91 to 105" do
    get :display, page: 6, page_size: 15
    15.times do |i|
      assert_equal i+91, assigns(:numbers)[i][:value]
    end
     assert assigns(:numbers)[15].nil?
  end
end
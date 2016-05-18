require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    # session[:page_size]=100
  end
  test "should get display" do
    get :display
    assert_response :success
  end
  
  test "Should get first 100 items by default" do
    get :display
    assert_response :success
    100.times do |i|
      assert_equal(i+1,assigns(:numbers)[i][:value])
    end
    assert assigns(:numbers)[100].nil?
  end
  
  test "should get 101 to 200" do
    get :display, page: 1
    assert_response :success
    100.times do |i|
      assert_equal(i+101,assigns(:numbers)[i][:value])
    end
    assert assigns(:numbers)[100].nil?
  end
  
  test "should change page_size" do
    get :set_page_size, page_size:15, current_page:1
    #Page 1 had number 101, with page_size , page 6 had 101
    assert_equal session[:page_size].to_i, 15
    assert_redirected_to page_path 6
  end
  
  test "should get 91 to 105" do
    session[:page_size]=15
    get :display, page: 6
    15.times do |i|
      assert_equal(i+91,assigns(:numbers)[i][:value])
    end
     assert assigns(:numbers)[15].nil?
  end

end

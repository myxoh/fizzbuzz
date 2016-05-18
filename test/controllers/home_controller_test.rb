require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get display" do
    get :display
    assert_response :success
  end

end

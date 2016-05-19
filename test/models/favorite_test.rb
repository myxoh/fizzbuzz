require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  setup do
    @favorite = Favorite.new number: 16 #Unique
  end
  test "Should save" do
    assert @favorite.valid?
  end
  test "Should not save" do
    @favorite.number = 15
    assert_not @favorite.valid?
    @favorite.number = -1
    assert_not @favorite.valid?
    @favorite.number = 10**12 + 1
    assert_not @favorite.valid?
  end
end

require 'test_helper'

class FizzBuzzServiceTest < ActiveSupport::TestCase
  setup do
    @fizzbuzz=FizzBuzzService.new
  end
  
  test "last_page" do
    assert 10**10-1, @fizzbuzz.get_last_page
    @fizzbuzz=FizzBuzzService.new(0,1)
    assert 10**12-1, @fizzbuzz.get_last_page
  end
  
  test "serve" do
    numbers=@fizzbuzz.serve
    assert numbers[24][:favorite]
    assert_equal 100, numbers.length
    
    assert numbers[14][:favorite]
    assert_equal 15, numbers[14][:value]
    assert_equal "FizzBuzz", numbers[14][:fizzbuzz]
    
    numbers=@fizzbuzz.serve 2
    assert_not numbers[24][:favorite]
    assert_equal 100, numbers.length
    
    @fizzbuzz=FizzBuzzService.new(0,24)
    numbers=@fizzbuzz.serve
    assert numbers[24].nil?
    assert_equal 24, numbers.length
    
    @fizzbuzz=FizzBuzzService.new(1,24)
    numbers=@fizzbuzz.serve
    assert numbers[0][:favorite]
    assert_equal 24, numbers.length
    
    @fizzbuzz=FizzBuzzService.new(0,7)
    last_page=@fizzbuzz.get_last_page
    numbers=@fizzbuzz.serve last_page
    assert 7>numbers.length #Should serve an incomplete page
    
    numbers=@fizzbuzz.serve last_page+1
    assert numbers.empty?
  end
  
  test "change page" do
    @fizzbuzz=FizzBuzzService.new(1,100)
    #First item = 101
    assert_equal 6, @fizzbuzz.change_page_size(15)
    #15*6 (+15) 90 .. 105
    assert_equal 0, @fizzbuzz.change_page_size(15, 0)
  end
  
  test "fizzbuzz" do
    assert_equal "FizzBuzz", @fizzbuzz.fizzbuzz(45)
    assert_equal "Fizz", @fizzbuzz.fizzbuzz(6)
    assert_equal "Buzz", @fizzbuzz.fizzbuzz(5)
    assert_equal 7, @fizzbuzz.fizzbuzz(7)
  end
  
end
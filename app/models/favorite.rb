class Favorite < ActiveRecord::Base
  validates :number, uniqueness:true
  def fizzbuzz
    FizzBuzzService.new.fizzbuzz(number)
  end
end

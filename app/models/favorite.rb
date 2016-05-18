class Favorite < ActiveRecord::Base
  validates :number, uniqueness:true
  validates :number, inclusion:1..10**12
  def fizzbuzz
    FizzBuzzService.new.fizzbuzz(number)
  end
end

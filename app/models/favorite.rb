class Favorite < ActiveRecord::Base
  validates :number, uniqueness:true
  validates :number, inclusion:1..10**12
  def fizzbuzz
    FizzBuzzService.new.fizzbuzz(number)
  end
  def as_json(options={}) 
    {
      :number => number,
      :fizzbuzz => fizzbuzz,
      :id => id
    }
  end
end

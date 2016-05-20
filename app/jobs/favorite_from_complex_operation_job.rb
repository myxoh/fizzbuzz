class FavoriteFromComplexOperationJob < ActiveJob::Base
  queue_as :default
  def perform number
    numbers = complex_operation number
    numbers.each do |prime|
      Favorite.create number: prime
    end
  end

  def complex_operation number
    primes = []
    begin
      number.times{primes.push true}
      primes[0] = false
      primes[1] = false
      (number).times do |num|
        if primes[num] then
          iterator = num
          cross = num + iterator
          while cross <= number do
            primes[cross] = false
            cross += iterator
          end
        end
      end
    rescue
      puts "#{number}: More than memory could handly"
    end
    prime_list=[]
    prime=0 
    primes.each do |is_prime|
        prime_list.push prime unless !is_prime
        prime+=1
    end
    prime_list
  end
end

class FizzBuzzService
  def initialize initial_page = 0, page_size=100
    @range = 1..100000000000 # 1 .. 100,000,000,000
    @page_size = (page_size.to_i>0)? page_size.to_i : 100
    @initial_page = (initial_page.to_i>0)? initial_page.to_i : 0
  end
  
  def serve page = nil
    page||=@initial_page
    init = page * @page_size + 1
    last = init + @page_size - 1
    
    last = (@range.include? last)? last : @range.max
    range = (init..last)
    numbers = range.to_a
    favorites = Favorite.where(number:range).collect{|f| f.number}
    numbers.collect do |n|
    fizzbuzz = fizzbuzz n
    {value:n, fizzbuzz:fizzbuzz, favorite:favorites.include?(n)}
    end
  end
  
  def get_last_page
    pages = ( (@range.max-1) / @page_size.to_f ).floor
  end
  
  def change_page_size page_size, page = nil
    page_size = page_size.to_i
    page||=@initial_page
    page = page.to_i
    value = (serve page)[0][:value] #First Value
    @page_size = (page_size.to_i>0)? page_size.to_i : 100
    return find_page_by_value value
  end
  
  def fizzbuzz n
     case
        when n%15==0
          fizzbuzz = "FizzBuzz"
        when n%5==0
          fizzbuzz = "Buzz"
        when n%3==0
          fizzbuzz = "Fizz"
        else
          fizzbuzz = n
      end
  end
  
  private
  def find_page_by_value value
    (value/@page_size.to_f).floor
  end
  
end
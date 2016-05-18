module Api::V1
  class NumbersController < ApiController
      def display
        @page=params[:page].to_i
        @page_size=params[:page_size].to_i
        fizzbuzz=FizzBuzzService.new @page, @page_size 
        @last_page=fizzbuzz.get_last_page
        @numbers=fizzbuzz.serve
        render json:@numbers
      end
  end
end

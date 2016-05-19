class HomeController < ApplicationController
  def display
    @page = params[:page].to_i
    @page_size = session[:page_size]
    @page_size ||= 100
    fizzbuzz = FizzBuzzService.new @page, @page_size
    @last_page = fizzbuzz.get_last_page
    @numbers = fizzbuzz.serve
    @favorites = Favorite.all.order(:number)
  end

  def set_page_size
    fizzbuzz = FizzBuzzService.new params[:current_page], session[:page_size] #Original Page Size
    session[:page_size] = params[:page_size]
    page = fizzbuzz.change_page_size session[:page_size], params[:current_page] #Returns new Page Number
    redirect_to page_path(page)
  end
end

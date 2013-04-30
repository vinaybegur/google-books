class BooksController < ApplicationController

  def index
    search_condition = params[:input_value].to_s
    @books_array = GoogleBooks.search(search_condition, {:order_by => 'newest', :count => 40, :api_key => 'AIzaSyD2XAREb5Z8fP7GjLGF3yQMnOUTgx43sTg'})
    @books = Kaminari.paginate_array(@books_array.to_a).page(params[:page]).per(5)
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.save
    redirect_to root_path
  end

end

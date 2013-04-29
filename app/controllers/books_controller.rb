class BooksController < ApplicationController


  def search_books
    
  end

  def index
    if params[:input_value] and !params[:input_value].blank?
      search_condition = params[:input_value].to_s
      @books_array = GoogleBooks.search(search_condition, {:order_by => 'newest', :count => 20})
      
 
  @books = Kaminari.paginate_array(@books_array.to_a).page(params[:page]).per(5)

    else
      flash[:error] = "Please enter search criteria and try again."
      redirect_to root_path
    end
    
    #    @books.each do |b|
    #      puts "&&&&&&&&&&&&&&&&&&&&&&&&&&"
    #      if b.authors
    #        puts b.authors.inspect
    #      end
    #      if b.title
    #        puts b.title.inspect
    #      end
    #      if b.image_link
    #        puts b.image_link(:zoom => 5).inspect
    #      end
    #      puts "&&&&&&&&&&&&&&&&&&&&&&&&&&"
    #    end
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

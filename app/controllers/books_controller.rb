class BooksController < ApplicationController

  def index
    if params[:input_value] and !params[:input_value].blank?
      search_condition = params[:input_value].to_s
      if Key.exists?(:input_value => params[:input_value].to_s)
        @key = Key.find_by_input_value(params[:input_value].to_s)
        @books_array = @key.values
        @books = Kaminari.paginate_array(@books_array.to_a).page(params[:page]).per(10)
      else
        @books_array = GoogleBooks.search(search_condition, {:order_by => 'newest', :count => 40})
        @key = Key.create(:input_value => params[:input_value].to_s)
        @books_array.each_with_index do |book|
          Value.create(:key_id => @key.id, :authors => book.authors, :title => book.title, :image_link => book.image_link)
        end
        @books = Kaminari.paginate_array(@books_array.to_a).page(params[:page]).per(10)
      end
    else
      @books = []
    end
  end

end

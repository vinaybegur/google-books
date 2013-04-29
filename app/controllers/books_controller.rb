class BooksController < ApplicationController
  require 'will_paginate/array'

  def search_books
    
  end

  def index
    puts "AAAAAAAAAAAAAAAAAA"
    if params[:input_value] and !params[:input_value].blank?
      search_condition = params[:input_value].to_s
      @books_array = GoogleBooks.search(search_condition, {:order_by => 'newest', :count => 20})
      @books = @books_array#.paginate(:page => 1, :per_page => 5)
      puts @books.inspect
      #            @arr_books = Book.all
      #            @books = @arr_books.paginate(:page => 1, :per_page => 2)
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

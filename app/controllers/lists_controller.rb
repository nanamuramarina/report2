class ListsController < ApplicationController
  def new
    @books= Book.new
    books.save
    redirect_to '/books/new'
  end

  def index
    @books = Book.all
  end

  def create
    book=Books.new(book_params)
    book.save
    redirect_to '/top'
  end
  

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:list) .permit(:title, :body)
  end
end

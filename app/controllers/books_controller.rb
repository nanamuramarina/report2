class BooksController < ApplicationController
  module ApplicationHelper
  def full_title(page_title='WebCampBackendNew')
    base_title="WebCampBackendNew"
    if page_title.empty?
      base_title
     else
      "#{ page_title } | #{ base_title}"
     end
    end
   end


  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @books = Book.all.order(created_at: :desc)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end


  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    book = Book.find(params[:id])
    Book.update(book_params)
    redirect_to book_path(book.id)
  end

  private
  def book_params
    params.require(:book) .permit(:title, :body)
  end
end
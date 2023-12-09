class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/books/index'
  end

  def index
   @books = Book.all
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  #ストロングパロメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

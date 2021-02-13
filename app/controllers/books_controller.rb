class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path @book
  end

  def index
    @books = Book.all
    @users = User.all
    @user = User.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
    @users = User.all
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.new(book_params)
    @book.update(book_params)
    redirect_to book_path @book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end

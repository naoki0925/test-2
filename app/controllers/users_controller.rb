class UsersController < ApplicationController

  def new
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

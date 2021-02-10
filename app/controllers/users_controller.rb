class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end



  def create
    book = Book.new(book_params)
    book.save
    redirect_to controller: :user, action: :show
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

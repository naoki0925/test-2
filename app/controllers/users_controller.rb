class UsersController < ApplicationController

  def new
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @user = User.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path @book
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path @user
  end

  private
  def book_params
    params.permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

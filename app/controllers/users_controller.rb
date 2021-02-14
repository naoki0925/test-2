class UsersController < ApplicationController

  def new
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @books = Book.page(params[:page]).reverse_order
  end

  def index
    @books = Book.all
    @users = User.all
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
    if @user.update(user_params)
      redirect_to user_path @user
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

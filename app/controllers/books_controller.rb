class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)#空のデータにbook_paramsが入っている
    @book.user_id = current_user.id
    if @book.save               #@bookに保存している
      flash[:notice] = "You have created book successfully."
      redirect_to book_path @book
    else
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new #urlのidのデータ
    @booknew = Book.find(params[:id])
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user ==current_user
      render "edit"
    else
      redirect_to book_path @book
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end

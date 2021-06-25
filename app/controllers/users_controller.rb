class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
  end

  def creat
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end

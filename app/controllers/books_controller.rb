class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @book_id = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
    @book_id = Book.find(params[:id])
  end

  def update
    book_id = Book.find(params[:id])
    book_id.update(book_params)
    redirect_to book_path(book_id)
  end

  def destroy
    book_id = Book.find(params[:id])
    book_id.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end

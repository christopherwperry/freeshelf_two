class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user == current_user
      @book.update!(book_params)
      redirect_to @book, notice: 'book has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user == current_user
      @book.destroy
      redirect_to books_path
    else
      render 'show'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :name, :author, :description, :URL)
  end

end

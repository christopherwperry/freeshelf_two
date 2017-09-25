class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
    if @book.update_attributes(allowed_params)
      redirect_to @book, notice: 'book has been updated'
    else
      render :edit
    end
  end

  private

  def allowed_params
    params.require(:book).permit(:title, :name, :author, :description, :URL)
  end

end

class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def edit
    flash[:update] = 'Book was successfully updated'
    @book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), flash: {notice: 'Book was successfully created'}
    else
      @books = Book.all
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

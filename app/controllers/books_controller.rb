class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @params = params
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'update success!!'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy if @book
    redirect_to books_path, notice: 'destory success!!'
  end

  private

  def find_book
    @book = Book.find_by(id: params[:id])
    redirect_to books_path if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :content, :price)
  end
end

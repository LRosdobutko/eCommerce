class BooksController < ApplicationController

  def index
    @books = Book.paginate(page: params[:page], per_page: 10) # Adjust the per_page as needed
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :synopsis, :price_cents, :Genre_id, :on_sale)
  end


end


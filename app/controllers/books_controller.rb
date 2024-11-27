class BooksController < ApplicationController

  def index
    @books = Book.paginate(page: params[:page], per_page: 10) # Adjust the per_page as needed
  end

  def show
    @book = Book.find(params[:id])
  end

  before_action :set_book, only: [:edit, :update, :show]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      render :new
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def search
    @books = Book.all

    if params[:search_type].present? && params[:query].present?
      case params[:search_type]
      when 'book_name'
        @books = @books.where("title LIKE ?", "%#{params[:query]}%")
      when 'genre'
        @books = @books.joins(:genre).where("genres.name LIKE ?", "%#{params[:query]}%")
      end
    end

    if params[:on_sale] == '1'  # '1' is sent if checkbox is checked
      @books = @books.where(on_sale: true)
    end

    if params[:recently_added] == '1'  # '1' is sent if checkbox is checked
      @books = @books.where("created_at >= ?", 3.days.ago)
    end

    render :search_results
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :synopsis, :price_cents, :genre_id, :on_sale)
  end


end


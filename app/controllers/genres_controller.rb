class GenresController < ApplicationController
  def index
    @genres = Genre.paginate(page: params[:page], per_page: 10) # Paginate genres, 10 per page
  end

  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books.paginate(page: params[:page], per_page: 10) # Paginate books for each genre, 5 per page
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(Genre_params)

    if @genre.save
      redirect_to @genre
    else
      render :new, status: :unprocessable_entity
    end

  end


  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(Genre_params)
      redirect_to @genre
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def Genre_params
    params.require(:Genre).permit(:name, :description)
  end



end

class GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page]).per(10)  # Kaminari's pagination for genres
  end

  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books.page(params[:page]).per(10)  # Kaminari's pagination for books in the selected genre
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
    params.require(:genre).permit(:name, :description)  # Ensure the param name matches the model
  end
end

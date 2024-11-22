class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
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

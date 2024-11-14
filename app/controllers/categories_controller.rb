class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: "...", description: "...")

    if @category.save
      redirect_to @category
    else
      render: :new, status: :unprocessable_entity
    end

  end
end

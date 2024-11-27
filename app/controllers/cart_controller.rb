class CartController < ApplicationController
  before_action :get_book, only: %i[create destroy]

  def create
    session[:cart] ||= []  # Ensure the cart is initialized

    unless session[:cart].include?(@book.id)
      session[:cart] << @book.id
      flash[:notice] = "#{@book.title} added to cart"
    end

    # Redirect back to the current book page
    redirect_back(fallback_location: root_path)
  end

  def destroy

    if session[:cart].include?(@book.id)
      session[:cart].delete(@book.id)
    end

    # Redirect back to the current book page
    redirect_back(fallback_location: root_path)
  end

  private

  def get_book
    book_id = params[:id].to_i
    @book = Book.find(book_id)
  end

end

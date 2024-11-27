class CartController < ApplicationController

  def create
    book_id = params[:id].to_i
    session[:cart] ||= []  # Ensure the cart is initialized

    unless session[:cart].include?(book_id)
      session[:cart] << book_id
    end

    # Redirect back to the current book page
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book_id = params[:id].to_i

    if session[:cart].include?(book_id)
      session[:cart].delete(book_id)
    end

    # Redirect back to the current book page
    redirect_back(fallback_location: root_path)
  end

end

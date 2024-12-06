class CheckoutController < ApplicationController

  def create
    book = Book.find(params[:book_id])




  end

  def success
    #Go here on payment success
  end

  def cancel
    #Go here if something failed
  end
end

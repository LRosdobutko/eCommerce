class CheckoutController < ApplicationController

  def create
    book = Book.find(params[:book_id])

    if book.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: [
        price_data: {
          currency: "cad",
          product_data: {
            name: book.title,
            description: book.synopsis,
          },
          unit_amount: book.price_cents,
        },
        quantity: 1
      ]
    )

    redirect_to @session.url, allow_other_host: true




  end

  def success
    #Go here on payment success
  end

  def cancel
    #Go here if something failed
  end
end

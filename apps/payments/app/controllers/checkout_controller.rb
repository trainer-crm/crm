require 'stripe'

class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def show
    pay_customer = current_user.payment_processor
    Stripe.api_key = ENV.fetch("STRIPE_SECRET_KEY")

    @checkout_session = pay_customer.checkout(
      mode:        "subscription",
      line_items:  [
        {
          price:    "price_1ROnwD06FlnXmGnsjHVkrsMC",
          quantity: 1
        }                    
      ],                    
      success_url: checkout_success_url,
      cancel_url:  checkout_url
    )

    render json: { id: @checkout_session.id, url: @checkout_session.url }
  end

  def success
    head :ok
  end
end
class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    @amount = 500 # add product amount variable in cents (e.g. @product.amount * 100)

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'GrowthPal Payment', # make dynamic with product variable
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
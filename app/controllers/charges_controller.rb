class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
    # Product amounts in dollars
    @website_package = 10000
    @other_package = 5000
  end

  def create
    # get params from form
    email = current_user.email
    token = params[:stripeToken]
    product = params[:product_id]

    # Set Product amount to cents
    case product
    when "website-package"
      @amount = 10000
    when "other-package"
      @amount = 5000
    else
      redirect_to new_charge_path
    end

    customer = Stripe::Customer.create(
      :email => email,
      :card  => token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'GrowthPal Payment', # make dynamic with product variable
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
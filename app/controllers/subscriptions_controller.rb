class SubscriptionsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    # get params from form
    email = current_user.email
    plan_id = params[:plan_id]
    token = params[:stripeToken]
   
    # create a new subscription in the database
    s =  Subscription.new
    s.email = email
    s.plan_id = plan_id
    s.stripe_token = token
    s.save
   
    # create a new customer and associate them with a subscription plan
    customer = Stripe::Customer.create(
      :card => token,
      :plan => plan_id,
      :email => email
    )
   
  # handle errors
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end

end

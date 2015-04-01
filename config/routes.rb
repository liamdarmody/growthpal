Growthpal::Application.routes.draw do

  root "pages#home"

  # Pages
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  
  # Devise
  devise_for :users

  # Stripe Charges
  resources :charges, :path => '/payments', :only => [:new, :create]

  # Stripe Subscriptions
  resources :subscriptions, :only => [:new, :create]

  # User Admin
  namespace :admin do
    root "base#index"
    resources :users
  end

  # Define routes for comfy blog
  comfy_route :blog_admin, :path => '/admin'
  comfy_route :blog, :path => '/blog'

  # Define route for cms_admin
  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end

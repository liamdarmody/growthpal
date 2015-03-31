Growthpal::Application.routes.draw do

  root "pages#home"

  # Pages
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  
  # Blogs Posts
  get "posts", to: "pages#posts", as: "posts"
  get "posts/:id", to: "pages#show_post", as: "post"
  devise_for :users

  # Stripe Charges
  resources :charges, :path => '/payments', :only => [:new, :create]

  # Stripe Subscriptions
  resources :subscriptions, :only => [:new, :create]

  # Admin
  namespace :admin do
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end

  # Define route for cms_admin
  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end

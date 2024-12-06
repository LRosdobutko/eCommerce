Rails.application.routes.draw do
  get "home/landing"
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "genres#index"
  #root "home#landing"

  resources :genres do
    resources :books
  end

  resources :books do
    collection do
      get :search
    end
  end

  resources :cart, only: %i[create destroy show]

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end

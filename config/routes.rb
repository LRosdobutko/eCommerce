Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "books#index" # or replace with your desired controller#action

  resources :genres do
    resources :books
  end

  resources :books do
    collection do
      get :search
    end
  end

  resources :cart, only: %i[create destroy show]

end

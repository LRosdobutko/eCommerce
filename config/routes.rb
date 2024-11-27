Rails.application.routes.draw do

  root "books#index" # or replace with your desired controller#action

  resources :genres do
    resources :books
  end

  resources :books do
    collection do
      get :search
    end
  end

end

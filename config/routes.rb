Rails.application.routes.draw do
  resources :genres do
    resources :books
  end
  resources :books
end

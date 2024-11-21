Rails.application.routes.draw do

  root "genres#index"

  resources :genres

  resources:products
end

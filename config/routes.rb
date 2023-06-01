Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :bills
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#splash"
end

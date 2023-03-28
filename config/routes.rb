Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cart, only: [:new, :create, :destroy, :index, :show]
  resources :items, only: [:new, :create, :index, :show, :edit, :destroy]
end

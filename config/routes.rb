Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :cart, only: [:new, :create, :show]
  #   collection do
  #     post add_item/:item_id', to: 'carts#add_item', as: :add_item
  #   end
  # end
  # Defines the root path route ("/")
  # root "articles#index"
end

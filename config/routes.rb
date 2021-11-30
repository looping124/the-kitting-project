Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'items#index'
  resources 'items'
  resources 'users'

  resources 'orders'

  resources 'carts'
  resources 'join_table_item_carts', only: [:create, :edit, :update, :destroy]

end

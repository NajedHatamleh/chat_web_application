Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :room_messages
  resources :rooms
  get 'rooms/:id/fetch', to: 'rooms#fetch_more', as: :fetch_more

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

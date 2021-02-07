Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get 'homes/about' => 'homes#home'
  resources :users, only: [:show]
end

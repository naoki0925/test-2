Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get 'home/about' => 'books#about'
  resources :users, only: [:show]
  resources :books
end

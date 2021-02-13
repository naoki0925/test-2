Rails.application.routes.draw do
  root to: 'users#top'
  get 'home/about' => 'users#about'
  resources :users, only: [:new, :show, :index, :create, :edit, :update]
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy]
end

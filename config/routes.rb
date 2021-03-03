Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get "home/about" => "homes#about"
  resources :users, only: [:new, :show, :index, :create, :edit, :update]
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy]
  resources :books do
  post 'add' => 'favorites#create'
  delete '/add' => 'favorites#destroy'
  end
end

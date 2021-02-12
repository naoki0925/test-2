Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get 'home/about' => 'users#about'
  resources :users, only: [:new, :show, :index, :create, :edit, :update] do
    post 'users/id' => 'users#create'
  end
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy]
end

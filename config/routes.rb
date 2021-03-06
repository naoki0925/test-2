Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get "home/about" => "homes#about"
  resources :users, only: [:new, :show, :index, :create, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'search' => 'searches#search'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to => "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
  end
  resources :books, only:[:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end

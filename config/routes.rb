Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :questions, except: [:show, :new, :index] do
    resources :likes, only: [:create, :destroy]
  end
  resources :hashtags, only: [:show], param: :name
  resource :session, only: [:new, :create, :destroy]
end

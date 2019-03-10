Rails.application.routes.draw do
  root 'users#index'
  resources :users, param: :username do
    get 'best', on: :member
  end
  resources :questions, except: [:show, :new, :index] do
    resources :likes, only: [:index, :create, :destroy]
  end
  resources :hashtags, only: [:show], param: :name
  resource :session, only: [:new, :create, :destroy]
end

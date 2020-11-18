Rails.application.routes.draw do
  devise_for :users
  root to: 'days#index'
  resources :days, except: :destroy do
      get :search, on: :collection
      resources :comments, only: :create
  end
end

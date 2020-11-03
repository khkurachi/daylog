Rails.application.routes.draw do
  devise_for :users
  root to: 'days#index'
  resources :days, only: [:index, :new, :create, :show, :update, :edit] do
      get :search, on: :collection
  end
end

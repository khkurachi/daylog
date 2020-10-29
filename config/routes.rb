Rails.application.routes.draw do
  devise_for :users
  root to: 'days#index'
  resources :days, only: [:new, :create, :show] do
    collection do
      get 'search'
    end
  end
end

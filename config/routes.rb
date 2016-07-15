Rails.application.routes.draw do
  resources :members
  devise_for :users, controllers: { registrations: "registrations" }
  as :user do
    get '/' => 'bars#index'
  end
  resources :bars do
    resources :reviews
    collection do
      get 'search'
    end
  end
  resources :reviews, only: [:edit, :destroy]

  resources :reviews, only: [:show] do
    resources :votes, only: [:create]
  end

  namespace :api do
    resources :reviews do
      resources :votes, only: [:create]
    end
  end
  resources :profiles, only: :show
end

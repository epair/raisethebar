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
  resources :profiles, only: :show
end

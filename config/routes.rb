Rails.application.routes.draw do
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
  resources :admins
  resources :profiles, only: :show
end

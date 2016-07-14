Rails.application.routes.draw do
  resources :users
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
  resources :profiles, only: :show
end

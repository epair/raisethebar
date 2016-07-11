Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  as :user do
    get '/' => 'devise/registrations#new'
  end
  resources :bars do
    collection do
      get 'search'
    end
  end
  resources :profiles, only: :show
end

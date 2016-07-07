Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
    as :user do
      get '/' => 'devise/registrations#new'
      resources :bars
    end
end

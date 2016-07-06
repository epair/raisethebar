Rails.application.routes.draw do
  root 'bars#index'
  resources :bars
end

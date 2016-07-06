Rails.application.routes.draw do
  root "bars#index"
  resources :bars do
    resources :reviews
  end
end

Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end
  root "projects#index"
  devise_for :users

  resources :projects do
    resources :tickets
  end
  
end

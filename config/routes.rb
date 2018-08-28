Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :projects, only: [:new, :create, :destroy]
  end
  root "projects#index"
  devise_for :users

  resources :projects, only: [:index, :show, :edit, :update] do
    resources :tickets
  end
  
end

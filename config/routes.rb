Rails.application.routes.draw do
  devise_for :users
  root to: 'users#dashboard'
  resources :producers, only: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

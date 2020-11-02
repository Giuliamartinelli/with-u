Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#incoming'
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/fakecall', to: 'pages#fakecall', as: 'fakecall'
  get '/tutorial', to: 'pages#tutorial', as: 'tutorial'
  resources :angels, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

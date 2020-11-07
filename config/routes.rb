Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  get '/incoming', to: 'pages#incoming', as: 'incoming'
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/fakecall', to: 'pages#fakecall', as: 'fakecall'
  get '/tutorial', to: 'pages#tutorial', as: 'tutorial'
  get '/map', to: 'pages#map', as: 'map'
  get '/call_angels', to: 'pages#call_angels', as: 'call_angels'
  resources :angels, only: [:new, :create]
  resources :maps, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

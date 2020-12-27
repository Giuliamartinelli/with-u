Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#welcome'
  get '/incoming', to: 'pages#incoming', as: 'incoming'
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/fakecall', to: 'pages#fakecall', as: 'fakecall'
  get '/tutorial', to: 'pages#tutorial', as: 'tutorial'
  get '/map', to: 'pages#map', as: 'map'
  get '/call_angels', to: 'pages#call_angels', as: 'call_angels'
  get '/code', to: 'pages#code', as: 'code'
  post '/profile', to: 'pages#verify', as: 'verify'
  resources :angels, only: [ :new, :create, :edit, :update, :destroy ]
  resources :maps, only: [ :new, :create ]


  # API routing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :angels, only: [ :create, :update, :destroy, :index ]
      resources :verifications, only: [ :create, :index ]
      #get '/user', to: 'api#user'
      post '/create_location', to: 'methods#create_location'
      post '/call_angels', to: 'methods#call_angels'
      post '/send_location_sms', to: 'methods#send_location_sms'
      post '/send_verification', to: 'methods#send_verification'
      post '/verify_number', to: 'methods#verify_phone_number'
    end
  end

end

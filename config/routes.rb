Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get '/secret', to: 'pages#secret', as: :secret
end

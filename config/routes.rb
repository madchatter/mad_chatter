MadChatter::Engine.routes.draw do

  require 'faye'
  Faye::WebSocket.load_adapter('thin')
  # mount Faye::RackAdapter.new(:timeout => 25), at: '/faye'
  mount Faye::RackAdapter.new(:mount => '/faye', :timeout => 25) => '/mad_chatter'

  resources :users

  scope 'auth', as: :auth do
    get 'login' => 'sessions#new', as: :login
    post 'login' => 'sessions#create'
    match 'logout' => 'sessions#destroy'
  end

  resources :rooms do
    resources :messages
  end

  root to: 'rooms#index'

end

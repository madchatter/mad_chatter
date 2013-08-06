MadChatter::RailsEngine.routes.draw do

  
  mount MadChatter::Protocols::SSE => '/protocols/sse', as: :sse_protocol

  # HTTP protocol:

  resources :users # provides ability to sign-up as a new user

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

Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/about' => 'application#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/profile' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fb_create'

    # get 'sessions/auth'


  resources :users
  resources :sneakers
  resources :brands
  resources :comments

  resources :brands do
    resources :sneakers
  end

  resources :users do
    resources :sneakers
  end

  resources :sneakers do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/profile' => 'users#show'
  get '/trending' => 'sneakers#trending'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/delete' => 'users#destroy'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/auth/facebook/callback' => 'sessions#fb_create'

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

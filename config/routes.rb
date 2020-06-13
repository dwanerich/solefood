Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/about' => 'application#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  

  

  resources :users
  resources :sneakers
  resources :brands
  resources :comments

  resources :brands do
    resources :sneakers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

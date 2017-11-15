Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end

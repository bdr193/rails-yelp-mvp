Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end

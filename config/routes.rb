Rails.application.routes.draw do
  root 'users#new'
  get 'users/new'

  resources :users, except: :index
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, except: :index

  # aliases:
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  post 'users/sessions', to: 'users#sessions'

  # feed to be included in the home controller, i.e. get 'feed', to: 'home/#feed'
  get 'feed', to: 'feed#index'
end

Rails.application.routes.draw do
  root 'users#new'
  get 'users/new'




  resources :users, except: :index do
      get '/friends', to: 'users#friends'
  end
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, except: :index do
    resources :comments, only: [:new, :create, :index]
  end

  post '/users/send.json', to: 'users#send_request'
  post '/users/accept.json', to: 'users#accept_request'
  post '/users/reject.json', to: 'users#reject_request'


  # aliases:
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  post 'users/sessions', to: 'users#sessions'

  # feed to be included in the home controller, i.e. get 'feed', to: 'home/#feed'
  get 'feed', to: 'feed#index'
end

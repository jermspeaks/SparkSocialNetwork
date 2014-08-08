Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :users

  resources :photos

  # feed to be included in the home controller, i.e. get 'feed', to: 'home/#feed'
  get 'feed', to: 'feed#index', status: 401
end

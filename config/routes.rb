Rails.application.routes.draw do
  root to: 'home#index'
  patch '/capture/:id', to: 'pokemon#capture', as: 'capture'
  patch '/damage/:id', to: 'pokemon#damage', as: 'damage'
  get '/new', to: 'pokemon#new', as: 'new'
  post '/create', to: 'pokemon#create', as: 'create'
  devise_for :trainers
  resources :trainers
end

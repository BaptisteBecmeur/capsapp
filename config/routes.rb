Rails.application.routes.draw do

  devise_for :users, :path=>'',
                     :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                     :controllers=>{:registrations=>'registrations', :confirmations => 'confirmations'}

  root 'pages#home'

  resources :users, only: [:show]
  resources :prestations do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/your_books' => 'reservations#your_books', path: 'mes-spectacles'
  get '/your_reservations' => 'reservations#your_reservations', path: 'suivi-des-reservations'

  get'/search' => 'pages#search'

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

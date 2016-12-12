Rails.application.routes.draw do
  # get 'users/finish_signup'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  
  root "games#index"
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
resources :games do
  resources :users, only: [:update]
  resources :squares, only: [:update] 
end
resources :users do
  resources :games
end
  
mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

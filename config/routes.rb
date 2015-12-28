Rails.application.routes.draw do

  get 'markers/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

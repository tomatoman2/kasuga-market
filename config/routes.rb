Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index"
  resources :home, only: [:index]
  resources :items, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

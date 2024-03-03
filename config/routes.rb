Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect("/login")

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Authority Controller
  get :login, to: 'authority#login', as: 'login'
  post :login_parse, to: 'authority#login_parse', as: 'login_parse'
  post :logout, to: 'authority#logout', as: 'logout'

  resources :character_fights, only: [:edit, :update, :destroy] do
    member do
      get :edit_initiative
      get :edit_pv
    end
  end

  resources :characters, except: [:show] do
  end

  resources :fights, only: [:index, :show] do
    member do
      post :next, as: 'next'
    end

    resources :character_fights, only: [:index, :create]
  end

end

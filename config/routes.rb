Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect("/game")

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :game, only: [:index] do
    collection do
      post :next, as: 'next'
      post :add_to_fight, as: 'add_to_fight'
    end
  end

  resources :character_fights, only: [:edit, :update] do
    member do
      get :edit_initiative
    end
  end

  resources :characters do
  end

end

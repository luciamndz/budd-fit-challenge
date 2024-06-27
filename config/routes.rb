Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :challenges, :except => [:edit, :update] do
    resources :challenge_infos, only: [:new, :create, :index]
    resources :invites, :only => [:new, :create]
  end
  resources :challenge_infos, only: [:edit, :update]
  resources :invites, :only => [:show, :edit, :update]
  post "change_status", to: "challenge_infos#change_status", as: :change_status
  get "/challenges/:challenge_id/challenge_infos/top3", to: "challenge_infos#top3", as: :top_3

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:index, :show] do
    collection do
      get "profile", to: "users#profile", as: :my_profile
    end
  end
end

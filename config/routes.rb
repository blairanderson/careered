Rails.application.routes.draw do
  root to: "root#index"
  get "ember" => "root#ember"
  get "react" => "root#react"

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"


  namespace :api do
    resources :users, only: [:show] do
      collection do
        get :current
      end
    end

    resources :api_keys

    resources :boards, only: [:index, :show, :create, :update]

    resources :lists, except: [:edit] do
      collection do
        post :sort
      end
    end

    resources :cards, except: [:edit] do
      collection do
        post :sort
      end
    end

    resources :card_comments, only: [:index, :create, :destroy]
  end
end

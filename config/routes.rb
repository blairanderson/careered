Rails.application.routes.draw do
  mount EmberCLI::Engine => "/ember-tests"

  root to: "root#index"
  get "ember" => "root#ember"
  get "ember/:id" => "root#ember"
  get "react" => "root#react"
  get "react/:id" => "root#react"

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"


  namespace :api do
    resources :api_keys
    resources :users, only: [:show] do
      collection do
        get :current
      end
    end

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

  # get ":id" => "application#not_found", as: :not_found
  # get "*/*" => "application#not_found"
end

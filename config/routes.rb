Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :trips do
    resources :bookmarks, only: [:index, :create, :new,:update]
    resources :landmarks, only: [:index, :edit, :destroy, :show, :update]
    resources :routes, only: [:index, :create, :new, :edit, :destroy, :show, :update ]do
      resources :landmarks, only: [:create, :new]
      resources :tags, only: [:create, :new]
    end
    resources :comments, only: [:index, :create, :new, :edit, :show, :update]
  end
  resources :comments, only: :destroy
  resources :bookmarks, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  # Defines the root path route ("/")
  # root "articles#index"
end

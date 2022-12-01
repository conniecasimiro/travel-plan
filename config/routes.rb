Rails.application.routes.draw do
  devise_for :users do
    resources :bookmarks, only: [:index, :create, :new, :destroy, :update]
  end
  root to: "pages#home"

  resources :trips do
    resources :landmarks, only: [:index, :edit, :destroy, :show, :update]
    resources :routes, only: [:index, :create, :new, :edit, :destroy, :show, :update ]do
      resources :landmarks, only: [:create, :new]
    end

    resources :tags, only: [:create, :new, :edit, :destroy, :update]
    resources :comments, only: [:index, :create, :new, :edit, :destroy, :show, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  # Defines the root path route ("/")
  # root "articles#index"
end

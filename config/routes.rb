Rails.application.routes.draw do
  devise_for :users do
    resources :bookmarks, only: [:index, :create, :new, :destroy, :update]
  end
  root to: "pages#home"

  resources :trips do
    resources :landmarks, only: [:index, :create, :new, :edit, :destroy, :show, :update]
    resources :routes, only: [:index, :create, :new, :edit, :destroy, :show, :update]
    resources :comments, only: [:index, :create, :new, :edit, :destroy, :show, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

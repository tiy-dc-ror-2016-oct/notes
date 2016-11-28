Rails.application.routes.draw do
  root "homepages#index"

  resources :contents do
    resources :comments, only: [:new, :create, :index, :show]
    member do
    end
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

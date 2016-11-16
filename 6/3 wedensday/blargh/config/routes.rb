Rails.application.routes.draw do
  # get 'micro_posts' => "micro_posts#index"
  resources :micro_posts, except: [:show] do
    member do
      get :download
    end
    collection do
      # for entire collection
      post :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # get 'micro_posts' => "micro_posts#index"
  get 'micro_posts', controller: :micro_posts, action: :index
  get 'micro_posts/new', controller: :micro_posts, action: :new
  post 'micro_posts', controller: :micro_posts, action: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

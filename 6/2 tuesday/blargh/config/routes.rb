Rails.application.routes.draw do
  # get 'micro_posts' => "micro_posts#index"
  get 'micro_posts', controller: :micro_posts, action: :index
  get 'micro_posts/new', controller: :micro_posts, action: :new
  post 'micro_posts', controller: :micro_posts, action: :create
  get "other/:thing", controller: :micro_posts, action: :create, as: "my_secret_route_two"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

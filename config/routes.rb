Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [ :index, :show ] do
    resources :posts, only: [:index, :show, :new, :create] do 
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end

Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [ :index, :show ] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
  

  # api related routes 
  get 'api/v1/users/:id/posts', to: 'api/v1/posts#index'

end

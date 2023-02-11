Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
  # get 'api/v1/users/:id/posts', to: 'api/v1/posts#index'
  # get 'api/v1/users/:user_id/posts/:post_id/comments', to: 'api/v1/comments#index'
  # post 'api/v1/users/:user_id/posts/:post_id/comments', to: 'api/v1/comments#create'
  # namespace :api do
  #   namespace :v1 do
  #     resources :users do
  #       resources :posts, only: [:index] do
  #         resources :comments, only: [:index, :create]
  #       end
  #     end
  #   end
  # end
  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :posts 
      end 
      resources :posts do
        resources :comments 
        resources :likes 
      end
    end
  end
end

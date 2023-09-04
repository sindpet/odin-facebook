Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show] do
    member do
      post 'send_friend_request', to: 'friend_requests#send_friend_request'
      post 'accept_friend_request', to: 'friend_requests#accept_friend_request'
      delete 'unfriend', to: 'friend_requests#unfriend'
    end
  end

  resources :posts, except: [:edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  # Defines the root path route ("/")
  root "posts#index"
end

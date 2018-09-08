Rails.application.routes.draw do
<<<<<<< HEAD
  
 
=======
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resource :user, only: [:update, :destroy]
      resource :signup, only: :create
      resource :session, only: :create
      resources :proclamations do
        resources :comments, only: [:index, :create]
      end
    end
  end
>>>>>>> 32360549e1f6ee2b2e229cc9312ebe7fcd332047
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
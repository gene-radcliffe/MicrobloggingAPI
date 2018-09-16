Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index] do
          resources :follows
      end
      resource :session, only: :create
      resources :proclamations do
        resources :comments, only: [:create]
      end
    end
  end
  
end
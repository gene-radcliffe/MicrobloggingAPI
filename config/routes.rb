Rails.application.routes.draw do

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
  
end
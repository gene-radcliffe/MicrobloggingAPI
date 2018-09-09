Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resource :user, only: [:create, :update, :destroy, :index]
      resource :session, only: :create
      resources :proclamations do
        resources :comments, only: [:index, :create]
      end
    end
  end
  
end
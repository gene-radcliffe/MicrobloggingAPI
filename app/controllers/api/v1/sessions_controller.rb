class Api::V1::SessionsController < ApplicationController
    skip_before_action :authenticate_token

    def create
        
       user = User.find_by_username(params[:username])
       
       if user && user.authenticate(params[:password]) then

    

    end
end

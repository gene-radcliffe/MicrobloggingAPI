class Api::V1::SessionsController < ApplicationController
    skip_before_action :authenticate_token

    def create
        
        begin
        user = User.find_by_username(params[:username])
        
        if user && user.authenticate(params[:password]) then
                @user=user
        end  
        rescue StandardError => e 
            render :json=> {
                :status => "Unauthorized",
                :message => "Thy auth'rization hast did fail"
            }
        end
    end
end

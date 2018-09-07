class ApplicationController < ActionController::API
    before_action :authenticate_token


    def authenticate_token
        if (params[:token] != nil)then

        end

    
    end
end

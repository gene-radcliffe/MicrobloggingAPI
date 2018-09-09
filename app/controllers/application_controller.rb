class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_action :authenticate_token

    
    def authenticate_token
  
      
        if params[:token] then
            #perform if token is passed in the parameter
            user = User.find_by_auth_token(params[:token])
        else

            user = authenticate_with_http_token do |token, options|
                User.find_by_auth_token(token)
                #test if these values will appear in other controller
                #after authentication.. erase these lines if you test fails
                @auth_user = user
                session[:user_id] = @auth_user.id
                session[:username] = @auth_user.username
                session[:token] = @auth_user.auth_token
                ##
            end
        end
          unless user
           
            render json: { error: "thou art not alloweth to useth these resources" }, status: :unauthorized
          end
    
    end

    def authenticate_user_password
        authenticate_this_user = authenticate_with_http_basic do |username, password|
             user = User.find_by_username(username)
             if user && user.authenticate(password) 
                @auth_user= user 
             end

        end
        unless @auth_user
            render json: { error: "Thee ent'r'd the wrong us'r nameth and passeth w'rd" }, status: :unauthorized
        end
    end

end

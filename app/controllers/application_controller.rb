class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate_token

    def authenticate_token

        user = authenticate_with_http_token do |token, options|
            User.find_by_auth_token(token)

          end
      
          unless user
            render json: { error: "You don't have permission to access these resources" }, status: :unauthorized
          end
    end
end

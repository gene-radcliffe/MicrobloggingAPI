class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        # Compare the tokens in a time-constant manner, to mitigate
        # timing attacks.
        User.find_by_auth_token(token)
      end
    end

    def verified_user
      User.find_by auth_token: ActionController::HttpAuthentication::Token.token_and_options(request)[0]
    end


end

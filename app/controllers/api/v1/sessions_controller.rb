class Api::V1::SessionsController < ApplicationController
    skip_before_action :authenticate_token, only: [:create]

    def create
        begin
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password]) then
               
            session[:user_id] = @user.id
               session[:auth_token] = @user.auth_token

                render :json =>{
                    :status => :ok,
                    :message => "Authorized",
                    :token => @user.auth_token
               }
        else
            render :json => {
                :status => "Unauthorized",
                :message => "Thy auth'rization hast did fail"
            }
        end  
        rescue StandardError => e 
            render :json=> {
                :status => :internal_server_error,
                :message => "#{e}"
            }
        end
    end
end

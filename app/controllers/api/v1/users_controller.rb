class Api::V1::UsersController < ApplicationController
     skip_before_action :authenticate_token, only: :create

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        end

    end

    def index
        
        @users = User.all
        render json: @users
        
    end
  
    def create
  
        @user = User.new(signup_params)
       
        if @user.save then
        render :json =>{
            :status => :ok,
            :message => "thee has't regist'r'd, taketh this token #{@user.auth_token}"
        }
        else
            #render the user model errors
            render :json =>{
                :status => :bad_request,
                :message => @user.errors.messages
            }
            
        end
    end
    private
    
    def signup_params
        params.permit(:username, :password)
    end

private

  def user_params
      params.permit(:username, :password)
  end
end
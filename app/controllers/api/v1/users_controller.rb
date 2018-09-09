class Api::V1::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        end
    end

    def index
        @users = User.all        
    end

private

  def user_params
      params.permit(:username, :password)
  end
end
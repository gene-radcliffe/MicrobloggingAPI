class Api::V1::SignupsController < ApplicationController
  def create
    byebug
    @user.new(user_params)
    @user.save
    #signup
  end


private

def user_params
    params.permit(:username, :password)
end
end

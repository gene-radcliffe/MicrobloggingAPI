class Api::V1::SignupsController < ApplicationController
 

def create
         
  @user = User.new(user_params)
  @user.save
  
end
private

def user_params

  params.require(:user).permit(:username, :password)
end
end

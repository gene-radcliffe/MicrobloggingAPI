class Api::V1::FollowsController < ApplicationController
before_action :authenticate
   
    def index
     
        #gets all the followers
        followers = Follow.where user_id: params[:user_id]
        @followers = Array.new
        followers.each do |follower|
            user = User.find(follower.following_id)
            @followers << user
        end
        
    end
    def create
        
         follow = Follow.new(follow_param)

         follow.save
         user = User.find_by_user_id(params[:following_id])
        render json: {status: :ok, message: "you are now following #{user.username}"}
    end

    def destroy
        followers = Follow.where user_id: params[:user_id]
        unfollow = followers.find_by_following_id(params[:id])
    
        @user = User.find(unfollow.following_id)
        if !unfollow.destroy
            render json: {status: :bad_request, messsage: "error: #{unfollow.error.messages}"}
    
        end
        render 'api/v1/follows/show'
    end
    private

    def follow_param
        params.permit(:following_id, :user_id)
    end
end

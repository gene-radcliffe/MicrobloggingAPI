class Api::V1::FollowsController < ApplicationController
before_action :authenticate
   
    def index
      
    #    @following = Follow.where following_id: params[:user_id]
    #     render :json =>{
    #         :status => :ok,
    #         :message => @following

    #     }
        #gets all the followers
        @followers = Follow.find(params[:user_id])
        render :json =>{
            :status => :ok,
            :message => @followers

        }
    end
    def create
        
         follow = Follow.new(follow_param)

         follow.save
         user = User.find(params[:following_id])
        render json: {status: :ok, message: "you are now following #{user.username}"}
    end
    def destroy
        byebug
        unfollow = Follow.find(params[:id])
        @follow = unfollow
        if !unfollow.destroy
            render json: {status: :bad_request, messsage: "error: #{unfollow.error.messages}"}
        end
            
    end
    private

    def follow_param
        params.permit(:following_id, :user_id)
    end
end

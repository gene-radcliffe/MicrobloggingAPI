class Api::V1::FollowsController < ApplicationController
skip_before_action :authenticate_token
    def index
        ##gets people who are following you
       @following = Follow.where following_id: params[:user_id]
        render :json =>{
            :status => :ok,
            :message => @following

        }
        # #gets all the followers
        # @followers = Follow.find(params[:user_id])
        # render :json =>{
        #     :status => :ok,
        #     :message => @followers

        # }
    end
    def create
        
         follow = Follow.new(follow_param)
         follow.save
         render json: {status: :ok, message: "you are now following #{}"}
    end

    private

    def follow_param
        params.permit(:following_id, :user_id)
    end
end

class Api::V1::UsersController < ApplicationController
     skip_before_action :authenticate_token, only: :create

    def index
        
        

        @users = User.all
        
        render :json=>{
            :ok => :ok,
            :data => @users
        }
        
    end
  
    def create
  
        @user = User.new(signup_params)
       
        if @user.save then
        render :json =>{
            :status => :ok,
            :message => "thee has't regist'r'd"
        }
        else
            render :json =>{
                :status => :ok,
                :message => @user.errors.messages
            }
            
        end
    end
    private
    
    def signup_params
    
        params.permit(:username, :password)
    end

    
end

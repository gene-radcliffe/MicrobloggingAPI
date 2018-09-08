class Api::V1::UsersController < ApplicationController

    def index
        
        

        @users = User.all
        
        # render :json=>{
        #     :ok => :ok,
        #     :data => @users
        # }
        
    end

    
end

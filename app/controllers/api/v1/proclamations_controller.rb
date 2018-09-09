class Api::V1::ProclamationsController < ApplicationController
  skip_before_action :authenticate_token
  before_action :authenticate_user_password

# this controller has not yet implemented jbuilder

  def index
    @proclamations = Proclamation.all
    #render json: @proclamations
    # comment - i cannot get this to point to the jbuilder template
    # erase lines below if you have better luck
    
  end

  def create
    
    # needs authentication - user_id match account
    if @auth_user.id == params[:user_id]
      @proclamation = Proclamation.new(params.permit(:body, :user_id))
      if @proclamation.save
        render json: @proclamation
      else
        render json: @proclamation.errors, status: :bad_request
      end
    end
  end

  def show
    @proclamation = Proclamation.find(params[:id])
    render json: @proclamation
  end

  def update
    # needs authentication - admin account only
    if admin 
      @proclamation = Proclamation.find(params[:id])
      if @proclamation.update(params.permit(:body, :user_id))
        render json: @proclamation
      else
        render json: @proclamation.errors, status: :bad_request
      end
    end
  end

  def destroy
    # needs authentication - user_id match account
    
      @proclamation = Proclamation.find(params[:id])
      #added user_id matching
      if @auth_user.id == @proclamation.user_id
        if @proclamation.delete
          render :json => {
            :status => :ok, 
            :message => "Successfully deleted!",
          }
        end
      else
        render :json =>{
            :status => :bad_request,
            :message => "thou art f'rbidden to fordid this proclamation"
        }
      end
  end

  private

  def admin
    Administrators.find_by_user_id(@auth_user.id) 
  end
end

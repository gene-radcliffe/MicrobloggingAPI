class Api::V1::ProclamationsController < ApplicationController
  before_action :authenticate, except: [ :index, :show ]
# this controller has not yet implemented jbuilder

  def index
    @proclamations = Proclamation.all
  end

  def create
    @proclamation = Proclamation.new(params.permit(:body).merge({user_id: verified_user.id}))
    if @proclamation.save
      render json: @proclamation
    else
      render json: @proclamation.errors, status: :bad_request
    end
  end

  def show
    @proclamation = Proclamation.find(params[:id])
    render json: @proclamation
  end

  def update
    # needs authentication - admin account only.  Current authentication
    # is checking user only as a test, but should be replaced
    @proclamation = Proclamation.find(params[:id])
    if @proclamation.user_id == verified_user.id
      if @proclamation.update(params.permit(:body, :user_id))
        render json: @proclamation
      else
        render json: @proclamation.errors, status: :bad_request
      end
    end
  end

  def destroy
    @proclamation = Proclamation.find(params[:id])
    if @proclamation.user_id == verified_user.id
      if @proclamation.delete
        render :json => {
          :status => :ok, 
          :message => "Successfully deleted!",
        }
      end
    end
  end
end

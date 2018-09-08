class Api::V1::ProclamationsController < ApplicationController
  
# this controller has not yet implemented jbuilder

  def index
    @proclamations = Proclamation.all
    render json: @proclamations
  end

  def create
    # needs authentication - user_id match account
    @proclamation = Proclamation.new(params.permit(:body, :user_id))
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
    # needs authentication - admin account only
    @proclamation = Proclamation.find(params[:id])
    if @proclamation.update(params.permit(:body, :user_id))
      render json: @proclamation
    else
      render json: @proclamation.errors, status: :bad_request
    end
  end

  def destroy
    # needs authentication - user_id match account
    @proclamation = Proclamation.find(params[:id])
    if @proclamation.delete
      render :json => {
        :status => :ok, 
        :message => "Successfully deleted!",
      }
    end
  end

end

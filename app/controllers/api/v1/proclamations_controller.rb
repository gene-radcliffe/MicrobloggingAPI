class Api::V1::ProclamationsController < ApplicationController
  before_action :authenticate, except: [ :index, :show ]
# this controller has not yet implemented jbuilder

  def index
    @proclamations = Proclamation.all
    render json: @proclamations
  end

  def create
    # needs authentication - user_id match account
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

  private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        # Compare the tokens in a time-constant manner, to mitigate
        # timing attacks.
        User.find_by_auth_token(token)
      end
    end

    def verified_user
      User.find_by auth_token: ActionController::HttpAuthentication::Token.token_and_options(request)[0]
    end

end

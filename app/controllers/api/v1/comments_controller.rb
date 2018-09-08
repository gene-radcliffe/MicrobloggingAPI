class Api::V1::CommentsController < ApplicationController

  def index
    @comments = Proclamation.find(params[:proclamation_id]).comments
    render json: @comments
  end

  def create
    # needs authentication - user_id match account
    @comment = Comment.new(params.permit(:body, :proclamation_id, :user_id))
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :bad_request
    end
  end

end

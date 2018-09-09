class Api::V1::CommentsController < ApplicationController
  before_action :authenticate

  def create
    @comment = Comment.new(params.permit(:body, :proclamation_id).merge({user_id: verified_user.id}))
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :bad_request
    end
  end

end

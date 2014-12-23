class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @object = object_params[:type].constantize.find(object_params[:id])
    @new_comment = @object.comments.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @object = comment_params[:commentable_type].constantize.find(comment_params[:commentable_id])
    @comment = @object.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render partial: "comments/comment", locals: { comment: @comment.decorate }, layout: false, status: :created
    else
      render js: "alert('error saving comment');"
    end
    # <div class="alert alert-danger">...</div>
  end

  def destroy
  end

  def object_params
    params.require(:object).permit(:type, :id)
  end

  def comment_params
    params.require(:comment).permit(:title, :comment, :commentable_type, :commentable_id)
  end
end
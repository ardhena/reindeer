class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose(:object) { comment_params[:commentable_type].constantize.find(comment_params[:commentable_id]) }
  expose_decorated(:comments) { object.comments }
  expose_decorated(:comment) { comments.first }

  def new
    @new_comment = object.comments.new
    respond_to do |format|
      format.js
    end
  end

  def cancel
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = object.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.js
      end
      # render partial: "comments/comment", locals: { comment: @comment.decorate }, layout: false, status: :created
    else
      respond_to do |format|
        format.js   { render action: "new" }
        format.json { render json: @comment }
      end
      # render js: "alert('error saving comment');"
    end
    # <div class="alert alert-danger">...</div>
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:title, :comment, :commentable_type, :commentable_id)
  end
end
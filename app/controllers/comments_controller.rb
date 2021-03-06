# frozen_string_literal: true

class CommentsController < ApplicationController

  access admin: :all, client: [:create]
  before_action :set_comment, only: %i[update destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    post = Post.find(params[:post_id])
    @comment.post = post

    respond_to do |format|
      if @comment.save
        CommentsNotificationService.new(post_id: post.id).send_comment_notification

        @comments = post.comments
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to root_path, notice: "Comment was successfully updated" }
      else
        format.html { redirect_to root_path, notice: "Comment not was created" }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Comment was successfully deleted" } if @comment.destroy
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:message, :user_id, :post_id)
  end

end

# frozen_string_literal: true

class PostsController < ApplicationController

  access admin: :all
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show; end

  def edit; end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @post.update!(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was successfully deleted" } if @post.destroy
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :opened)
  end

end

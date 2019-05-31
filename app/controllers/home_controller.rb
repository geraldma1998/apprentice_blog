# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post_home = Post.find(params[:id])

    @header_title = @post_home.title
    @header_subtitle = helpers.set_user_information_post
    @comments = @post_home.comments

    @comment = Comment.new
  end

  def new
    @home_post = Post.new
  end

  def create
    @home_post = current_user.posts.new(home_post_params)

    respond_to do |format|
      if @home_post.save
        format.html { redirect_to @home_post, notice: "Post was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def home_post_params
    params.require(:post).permit(:title, :content, :opened, posts_categories_attributes: %i[id category_id _destroy])
  end

end

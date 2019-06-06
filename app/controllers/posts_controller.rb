# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :set_post, only: [:show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @header_title = @post.title
    @header_subtitle = helpers.set_user_information_post
    @comments = @post.comments
    @comment = Comment.new

    user_has_ranking = current_user && current_user.rankings.where(post_id: @post.id).count.positive?

    @user_ranking = if user_has_ranking
                      current_user.rankings.where(post_id: @post.id).first.rank
                    else
                      0
                    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :opened, posts_categories_attributes: %i[id category_id _destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

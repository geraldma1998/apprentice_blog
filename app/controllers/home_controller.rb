# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
    @users = Post.get_users_from_post_comments(2)
  end

  def show
    @post_home = Post.find(params[:id])

    @header_title = @post_home.title
    @header_subtitle = helpers.set_user_information_post
    @comments = @post_home.comments

    @comment = Comment.new
  end

end

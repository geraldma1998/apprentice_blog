# frozen_string_literal: true

class PostsCategoriesController < ApplicationController

  before_action :set_posts_category, only: %i[show edit update destroy]

  def index
    @posts_categories = PostsCategory.all
  end

  def new
    @posts_category = PostsCategory.new
  end

  def show; end

  def edit; end

  def create
    @posts_category = PostsCategory.new(posts_category_params)

    respond_to do |format|
      if @posts_category.save
        format.html { redirect_to @posts_category, notice: "PostsCategory was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @posts_category.update(posts_category_params)
        format.html { redirect_to @posts_category, notice: "PostsCategory was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @posts_category.destroy
        format.html do
          redirect_to posts_categories_path,
                      notice: "PostsCategory was successfully deleted"
        end
      end
    end
  end

  private

  def set_posts_category
    @posts_category = PostsCategory.find(params[:id])
  end

  def posts_category_params
    params.require(:posts_category).permit(:post_id, :category_id)
  end

end

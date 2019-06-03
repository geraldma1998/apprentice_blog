# frozen_string_literal: true

class RankingsController < ApplicationController

  access all: :all
  before_action :set_ranking, only: %i[show edit update destroy]
  before_action :set_index_type, only: :index

  def index
    if @index_type
      @rankings = Ranking.where(post_id: @post_id, user_id: current_user.id)
    else
      @posts = Post.all.sort_by(&:ranking_value).reverse
      @rankings = Ranking.all
    end
  end

  def new
    @ranking = Ranking.new
  end

  def show; end

  def edit; end

  def create
    @ranking = current_user.rankings.new(ranking_params)

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to @ranking, notice: "Ranking was successfully created." }
        format.json { render json: @ranking, status: :created }
      else
        format.html { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ranking.update(ranking_params)
        format.html { redirect_to @ranking, notice: "Ranking was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to rankings_path, notice: "Ranking was successfully deleted" } if @ranking.destroy
    end
  end

  private

  def set_ranking
    @ranking = Ranking.find(params[:id])
  end

  def set_index_type
    @index_type = params["index_type"]
    @post_id = params["post_id"]
  end

  def ranking_params
    params.require(:ranking).permit(:rank, :index_type, :user_id, :post_id)
  end

end

# frozen_string_literal: true

class RankingsController < ApplicationController

  access all: :all
  before_action :set_ranking, only: %i[destroy]
  before_action :set_index_type, only: :index
  before_action :set_ranking_match_by_search, only: :create

  def index
    @posts = Post.all.sort_by(&:ranking_value).reverse
  end

  def create
    exists_ranking ? update_ranking : create_ranking
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to rankings_path, notice: "Ranking was successfully deleted" } if @ranking.destroy
    end
  end

  private

  def set_ranking_match_by_search
    @ranking_match = Ranking.where(user_id: params[:user_id], post_id: params[:post_id])
  end

  def update_ranking
    @ranking = @ranking_match.first

    if @ranking.update(ranking_params)
      render json: @ranking, status: :ok
    else
      render json: @ranking.errors, status: :unprocessable_entity
    end
  end

  def create_ranking
    @ranking = Ranking.new(ranking_params)

    if @ranking.save
      render json: @ranking, status: :created
    else
      render json: @ranking.errors, status: :unprocessable_entity
    end
  end

  def exists_ranking
    @ranking_match&.count&.positive?
  end

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

# frozen_string_literal: true

class RankingsController < ApplicationController

  access all: :all
  before_action :set_ranking_match_by_search, only: :create

  def index
    @posts = Post.all.sort_by(&:ranking_value).reverse
  end

  def create
    ranking_exists ? update_ranking : create_ranking
  end

  private

  def json_render(message, status)
    render json: message, status: status
  end

  def create_ranking
    @ranking = Ranking.new(ranking_params)

    @ranking.save ? json_render(@ranking, :created) : json_render(@ranking.errors, :unprocessable_entity)
  end

  def ranking_exists
    @ranking_match&.count&.positive?
  end

  def ranking_params
    params.require(:ranking).permit(:rank, :index_type, :user_id, :post_id)
  end

  def set_ranking_match_by_search
    @ranking_match = Ranking.where(user_id: params[:user_id], post_id: params[:post_id])
  end

  def update_ranking
    @ranking = @ranking_match.first

    @ranking.update(ranking_params) ? json_render(@ranking, :ok) : json_render(@ranking.errors, :unprocessable_entity)
  end

end

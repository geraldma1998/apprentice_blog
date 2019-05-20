# frozen_string_literal: true

class RankingsController < ApplicationController

  before_action :set_ranking, only: %i[show edit update destroy]

  def index
    @rankings = Ranking.all
  end

  def new
    @ranking = Ranking.new
  end

  def show; end

  def edit; end

  def create
    @ranking = Ranking.new(ranking_params)

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to @ranking, notice: "Ranking was successfully created." }
      else
        format.html { render :new }
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

  def ranking_params
    params.require(:ranking).permit(:rank, :user_id, :post_id)
  end

end

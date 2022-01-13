class StagesController < ApplicationController

  def index
    @stages = Stage.where("date >= ?" , Date.today).where(status:2).order(:date)

  end

  def search
    @stages = Stage.search(params[:title],params[:actor],params[:date],params[:category],params[:time])
    render "index"
  end

  def show
    @stage = Stage.find(params[:id])
  end

  def admin_stage_show#申請待ち
    @stage = Stage.find(params[:id])

  end

  def actor_stage_show#公演者用
    @stage = Stage.find(params[:id])

  end

end

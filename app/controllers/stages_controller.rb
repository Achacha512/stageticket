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

end

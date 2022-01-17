class ActorsController < ApplicationController
  before_action :actor_login_required, only: [:show]

  def show
    @actor = current_actor
  end

  def new
    if cookies.signed[:actor_id].nil? && cookies.signed[:admin_id].nil? && cookies.signed[:user_id].nil?
      @actor = Actor.new
    else
      redirect_to :root, notice: "すでにログインしているアカウントがあるため新規登録できません"
    end
  end

  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      cookies.signed[:actor_id] = @actor.id
      redirect_to :root, notice: "団体会員登録を完了しました。"
    else
      render "new"
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.assign_attributes(params[:actor])
    if @actor.save
      redirect_to @actor, notice: "団体情報を変更しました"
    else
      render "edit"
    end

  end

  def destroy
    @actor = Actor.find(params[:id])
    cookies.delete(:user_id)
    cookies.delete(:actor_id)
    cookies.delete(:admin_id)
    @actor.destroy
    redirect_to :root, notice: "退会しました。"
  end

  def actor_request_stages
    @stages = current_actor.stages.where(status: 1).where("date >= ?", Date.today)
    @past = current_actor.stages.where(status: 1).where("date < ?", Date.today)
  end

  def actor_past_stages
    @stages = current_actor.stages.where(status: [2, 3]).where("date >= ?", Date.today)
    @past = current_actor.stages.where(status: [2, 3]).where("date < ?", Date.today)
  end

  def index
    @actors = Actor.all
  end

end

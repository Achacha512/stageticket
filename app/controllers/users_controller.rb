class UsersController < ApplicationController
  before_action :user_login_required, only: [:show]

  def show
    @user = current_user
  end

  def new
    if cookies.signed[:actor_id].nil? && cookies.signed[:admin_id].nil? && cookies.signed[:user_id].nil?
      @user = User.new
    else
      redirect_to :root, notice: "すでにログインしているアカウントがあるため新規登録できません"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies.signed[:user_id] = @user.id
      redirect_to :root, notice: "会員登録を完了しました。"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "会員情報を変更しました"
    else
      render edit
    end

  end

  def destroy
    @user = User.find(params[:id])
    cookies.delete(:user_id)
    cookies.delete(:actor_id)
    cookies.delete(:admin_id)
    @user.destroy
    redirect_to :root, notice: "退会しました。"
  end

end


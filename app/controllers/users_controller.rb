class UsersController < ApplicationController
  before_action :user_login_required, only: [:show]
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      redirect_to :root, notice: "会員登録を完了しました。"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root, notice: "退会しました。"
  end

end

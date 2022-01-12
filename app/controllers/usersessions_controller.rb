class UsersessionsController < ApplicationController
  def create
    user = User.find_by(login_name: params[:name])
    if user&.authenticate(params[:password]) && cookies.signed[:admin_id].nil? && cookies.signed[:actor_id].nil?
      cookies.signed[:user_id] = {value: user.id, expires: 30.minutes.from_now}
    else
      flash.alert = "名前とパスワードが一致しません"
      flash.alert = "すでにログインしているアカウントがあります。ログアウトしてからやり直してください。" unless cookies.signed[:admin_id].nil? && cookies.signed[:actor_id].nil?
    end
    redirect_to :root
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to :root
  end

end

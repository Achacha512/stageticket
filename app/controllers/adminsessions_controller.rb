class AdminsessionsController < ApplicationController
  def create
    admin = Admin.find_by(login_name: params[:name])
    if admin&.authenticate(params[:password]) && cookies.signed[:user_id].nil? && cookies.signed[:actor_id].nil?
      cookies.signed[:admin_id] = {value: admin.id, expires: 30.minutes.from_now}
    else
      flash.alert = "名前とパスワードが一致しません"
      flash.alert = "すでにログインしているアカウントがあります。ログアウトしてからやり直してください。" unless cookies.signed[:user_id].nil? && cookies.signed[:actor_id].nil?
    end
    redirect_to :root
  end

  def destroy
    cookies.delete(:admin_id)
    redirect_to :root
  end
end

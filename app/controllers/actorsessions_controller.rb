class ActorsessionsController < ApplicationController
  def create
    actor = Actor.find_by(login_name: params[:name])
    if actor&.authenticate(params[:password]) && cookies.signed[:user_id].nil? && cookies.signed[:admin_id].nil?
      cookies.signed[:actor_id] = {value: actor.id, expires: 30.minutes.from_now}
    else
      flash.alert = "名前とパスワードが一致しません"
      flash.alert = "すでにログインしているアカウントがあります。ログアウトしてからやり直してください。" unless cookies.signed[:user_id].nil? && cookies.signed[:admin_id].nil?
    end
    redirect_to :root
  end

  def destroy
    cookies.delete(:actor_id)
    redirect_to :root
  end
end

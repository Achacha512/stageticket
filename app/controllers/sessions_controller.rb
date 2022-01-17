class SessionsController < ApplicationController
  def create
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users/#show"
      user = User.find_by(login_name: params[:login_name])
    elsif path[:controller] == "actors/#show"
      actor = Actor.find_by(login_name: params[:login_name])
    elsif path[:controller] == "admin"
      admin = Admin.find_by(login_name: params[:login_name])
    end
    a = false

    if user&.authenticate(params[:password])
      cookies.signed[:user_id] = {value: user.id,expires: 6000.minutes.from_now}
      a = true
    else
      flash.alert = "IDとパスワードが一致しません"
    end

    if actor&.authenticate(params[:password])
      cookies.signed[:actor_id] = {value: actor.id,expires: 6000.minutes.from_now}
      a = true
    else
      flash.alert = "IDとパスワードが一致しません"
    end
    if admin&.authenticate(params[:password])
      cookies.signed[:admin_id] = {value: admin.id,expires: 6000.minutes.from_now}
      a = true
    else
      flash.alert = "IDとパスワードが一致しません"
    end

    if a == true
      flash.alert = "ログインしました"
    else
      flash.alert = "IDとパスワードが一致しません"
    end
    redirect_to :root




  end

  def destroy
    cookies.delete(:user_id)
    cookies.delete(:actor_id)
    cookies.delete(:admin_id)
    redirect_to :root
  end
end

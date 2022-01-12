class PasswordsController < ApplicationController
  # if current_user
  #   before_action :user_login_required
  # elsif current_actor
  #   before_action :actor_login_required
  # elsif current_admin
  #   before_action :admin_login_required
  # end



  def show
    if current_user
      redirect_to :user
    elsif current_actor
      redirect_to :actor
    elsif current_admin
      redirect_to :admin
    end
  end

  def edit
    if current_user
      @member = current_user
    elsif current_actor
      @member = current_actor
    elsif current_admin
      @menber = current_admin
    end
  end

  def update
    if current_user
      @member = current_user
    elsif current_actor
      @member = current_actor
    elsif current_admin
      @member = current_admin
    end

    current_password = params[:account][:current_password]
    if current_password.present?
      if @member.authenticate(current_password)
        @member.assign_attributes(params[:account])
        if @member.save
          if current_user
            redirect_to current_user, notice: "パスワードを変更しました。"
          elsif current_actor
            redirect_to current_actor, notice: "パスワードを変更しました。"
          elsif current_admin
            redirect_to current_admin, notice: "パスワードを変更しました。"
          end
        else
          @member.errors.add(:current_password, "パスワードの変更に失敗しました")
          render "edit"
        end
      else
        @member.errors.add(:current_password, "現在のパスワードが間違っています")
        render "edit"
      end
    else
      @member.errors.add(:current_password, "パスワードを入力してください")
      render "edit"
    end
  end
end

class UsersController < ApplicationController
  before_action :user_login_required, only: [:show]
  def show
    @user = current_user
  end
end

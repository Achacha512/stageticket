class AdminsController < ApplicationController
  before_action :admin_login_required, only: [:show]
  def show
    @admin = current_admin
  end
end

class AdminsController < ApplicationController
  before_action :admin_login_required, only: [:show]
  def show
    @admin = current_admin
  end

  def admin_request_stages#申請まち
    @stages = Stage.where(status: 1).where("date >= ?", Date.today)
  end

end

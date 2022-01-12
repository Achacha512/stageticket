class ActorsController < ApplicationController
  before_action :actor_login_required, only: [:show]
  def show
    @actor = current_actor
  end
end

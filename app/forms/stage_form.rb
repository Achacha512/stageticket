class StageForm
  include ActiveModel::Model
  attr_accessor :stage,:title, :actor_id, :date, :category_id, :time, :text, :seat,
  :seat_type, :seat_price, :errors , :storage

  def initialize()

    super
  end

  def save





  end



end
class StagesController < ApplicationController

  def index
    @stages = Stage.where("date >= ?", Date.today).where(status: 2).order(:date)

  end

  def search
    @stages = Stage.search(params[:title], params[:actor], params[:date], params[:category], params[:time])
    render "index"
  end

  def show
    @stage = Stage.find(params[:id])
  end

  def admin_stage_show #申請待ち
    @stage = Stage.find(params[:id])

  end

  def actor_stage_show #公演者用
    @stage = Stage.find(params[:id])

  end

  def new
    @stage = Stage.new
    6.times do
      @s_seat = Seat.new
    end
    12.times do
      @a_seat = Seat.new
    end
    12.times do
      @b_seat = Seat.new
    end
  end

  def create
    p 11111111111111111111111111
    p @s_price = params[:s_price]
    p @a_price = params[:a_price]
    p @b_price = params[:b_price]

    @stage = Stage.new(params[:stage])
    @stage.actor_id = current_actor.id
    p current_actor.id
    p params[:stage]

    if @stage.save!
      6.times do |idx|
        @seat = Seat.new(seat_type: "S#{idx}", stage_id: @stage.id, seat_price: @s_price)
        @seat.save!
      end
      12.times do |idx|
        @seat = Seat.new(seat_type: "A#{idx}", stage_id: @stage.id, seat_price: @a_price)
        @seat.save!
      end
      12.times do |idx|
        @seat = Seat.new(seat_type: "B#{idx}", stage_id: @stage.id, seat_price: @b_price)
        @seat.save!
      end
      redirect_to :root, notice: "申請しました"
    else
      render "new"
    end
  end

  def confirm
    @stage = Stage.new(params[:stage])
    @s_price = params[:s_price].to_i
    @a_price = params[:a_price].to_i
    @b_price = params[:b_price].to_i
    # if @stage.invalid?
    #   render "new"
    # end
  end

  def edit
    @stage = Stage.find(params[:id])
    p 11111111111111
    p @s_price = @stage.seats.find_by("seat_type like ?", "%S%").seat_price
    p @a_price = @stage.seats.find_by("seat_type like ?", "%A%").seat_price
    p @b_price = @stage.seats.find_by("seat_type like ?", "%B%").seat_price
  end

  def update
    @stage = Stage.find(params[:id])
    @stage.assign_attributes(params[:stage])
    if @stage.save
      if cookies.signed[:actor_id]
        redirect_to "/stages/#{@stage.id}/actor_stage_show", notice: "公演情報を更新しました"
      elsif cookies.signed[:admin_id]
        redirect_to :root, notice: "公演情報を更新しました"
      else
        render "edit"
      end
    end
  end

  def admin_past_stages#公演一覧
    @stage = Stage.where(actor_id: params[:actor_id]).where("date >= ?", Date.today)
    p @stage
    @past = Stage.where(actor_id: params[:actor_id]).where("date < ?", Date.today)
  end

end

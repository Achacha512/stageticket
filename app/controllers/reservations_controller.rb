class ReservationsController < ApplicationController
  before_action :user_login_required, only: [:new]

  def index
    @reservations = current_user.reservations
  end

  def new
    @stage = Stage.find(params[:stage_id])
    @reservation = Reservation.new()
  end

  def create

    @errors = []

    if params["seat"].nil?
      redirect_to "/stages/#{@stage.id}/reservations/new", notice: "座席を選択してください"

    else

      @stage = Stage.find(params[:stage_id])
      @stage_types = params["seat"]["seat_type"]
      p @stage
      p @stage_types

      ActiveRecord::Base.transaction do
        @reservation = Reservation.new(user_id: cookies.signed[:user_id], stage_id: Stage.find(params[:stage_id]).id)
        @s_seat = Seat.where("seat_type like ?", "%S%").where(stage_id: params[:stage_id], reservation_id: nil)
        @a_seat = Seat.where("seat_type like ?", "%A%").where(stage_id: params[:stage_id], reservation_id: nil)
        @b_seat = Seat.where("seat_type like ?", "%B%").where(stage_id: params[:stage_id], reservation_id: nil)

        if @stage_types.length >= 6
          @errors << "一度に予約できる席数は5席までです。"
        end

        if @reservation.save
          @stage_types.each do |seat|
            @seat = Seat.find_by(seat_type: seat, stage_id: params[:stage_id], reservation_id: nil)
            if @seat.nil?
              break @errors << "その座席は予約済みのため予約できません"
            end
            @seat.reservation_id = @reservation.id
            @seat.save
          end
        else
          # @errors << @reservation.errors.full_message
        end
        if @errors.present?
          raise ActiveRecord::RecordInvalid
        end
      rescue
        p "予約できませんでした"
      ensure
        @errors = "予約完了しました" unless @errors.present?
        if @errors.instance_of?(Array)
          render "new"
        else
          redirect_to :root, notice: @errors
        end
      end
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @stage = @reservation.stage
    @price = 0
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.stage.date >= Date.current.days_since(2)
      @reservation.destroy
      redirect_to "/users/#{current_user.id}/reservations", notice: "キャンセルしました"
    else
      redirect_to :user_reservation_path, notice: "キャンセル期間が過ぎているのでキャンセルできませんでした"
    end
  end
end






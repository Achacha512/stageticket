class Stage < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :seats, dependent: :destroy
  belongs_to :actor
  belongs_to :category

  validates :title, presence: true,
            length: {minimum: 1, maximum: 20}

  validates :text, presence: true,
            length: {minimum: 10,maximum: 400}


validate do
    if date < Date.current+3
      errors.add(:date, "公演日は今日より3日以降に設定してください")
    end
    unless Stage.where.not(id:id).where(date:date,time:time).where(status:2).count == 0
      errors.add(:date,"その日は予約が入っています。違う日時を指定してください")
    end

  end

  def seat_price(price)

    seats = self.seats.order("id")
    seats[0..5].each do |seat|
      seat.seat_price = price[0]#S席
      seat.save
    end
    seats[6..17].each do |seat|
      seat.seat_price = price[1]#A席
      seat.save
    end
    seats[18..29].each do |seat|
      seat.seat_price = price[2]#B席
      seat.save
    end
  end

  # def price_vali(price)
  #   price.each do |p|
  #     p=p.to_i
  #     unless p>0
  #       errors.add(:price,"金額が正しくありません")
  #       return true
  #     end
  #   end
  #   return false
  # end



  class << self
    def search(title, actor, date, category, time)
      rel = order("date").where(status: 2).where("date >= ?", Date.today)
      if title.present?
        rel = rel.where("title LIKE ?", "%#{title}%")
      end
      if date.present?
        rel = rel.where(date:date)
      end
      if actor.present?
        actor = Actor.where(name:actor).ids
        rel = rel.where(actor_id:actor)
      end
      if category.present? && category != "なし"
        category = Category.where(name:category).ids
        rel = rel.where(category_id:category)
      end
      if time.present? && time != "なし"
        if time == "午前の部"
          time = 1
        elsif time == "午後の部"
          time = 2
        end
        rel = rel.where(time: time)
      end
      rel
    end

  end
end

class Stage < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :seats, dependent: :destroy
  belongs_to :actor
  belongs_to :category

  # validates :title,
  #           length: {minimum: 1, maximum: 20}
  #
  # validates :text,
  #           length: {minimum: 10,maximum: 400}



  class << self
    def search(title, actor, date, category, time)
      rel = order("date").where(status: 2).where("date >= ?", Date.today)
      if title.present?
        rel = rel.where("title LIKE ?", "%#{title}%")
      end
      if date.present?
        rel = rel.where("date LIKE ?", "%#{date}%")
      end
      if actor.present?
        actor = Actor.where("name LIKE ? ","%#{actor}%").ids
        rel = rel.where(actor_id:actor)
      end
      if category.present? && category != "なし"
        category = Category.where("name LIKE ? ","%#{category}%").ids
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

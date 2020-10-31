class Day < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :today_point, format: {with: /\A[1-9]{2}\z/ }
    validates :happy
    validates :sad
    validates :effort
    validates :could_not
    validates :learn
    validates :impression
    validates :want_do
    validates :must_do
    validates :do_not
    validates :idea
  end
  
  def previous
    Day.where("id < ?",self.id).order("id DESC").first
  end
  def next
    Day.where("id > ?", self.id).order("id ASC").first
  end

##一週間分のレコードを取得する為の記述
  from  = Time.current.at_beginning_of_day
  to    = (from + 6.day).at_end_of_day
  days = Day.where(created_at: from...to)
end

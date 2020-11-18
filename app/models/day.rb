class Day < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true ,on: :create do
    validates :want_do
    validates :must_do
    validates :do_not
    validates :idea
  end
  with_options presence: true ,on: :update do
    validates :today_point, format: {with: /\A[1-9]{2}\z/ }
    validates :happy
    validates :sad
    validates :effort
    validates :could_not
    validates :learn
    validates :impression
  end
 
  
  def previous
    Day.where("id < ?",self.id).order("id DESC").first
  end
  def next
    Day.where("id > ?", self.id).order("id ASC").first
  end
end

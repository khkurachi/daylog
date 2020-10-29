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

end

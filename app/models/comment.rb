class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :day

  validates :text, presence: true
end

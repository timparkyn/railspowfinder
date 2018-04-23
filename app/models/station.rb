class Station < ApplicationRecord

  has_many :selections, dependent: :delete_all
  has_many :users, :through => :selections

  validates :code, presence: true
  # validates :user_id, presence: true

end

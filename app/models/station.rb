class Station < ApplicationRecord

  has_many :selections
  has_many :users, :through => :selections

  validates :code, presence: true

end

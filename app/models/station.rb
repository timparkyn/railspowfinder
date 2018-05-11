class Station < ApplicationRecord

  has_many :selections, dependent: :delete_all
  has_many :users, :through => :selections

  validates :code, presence: true
  attr_reader :admin_user

end

class User < ApplicationRecord

  has_many :selections
  has_many :stations, :through => :selections
  accepts_nested_attributes_for :selections, reject_if: :all_blank, allow_destroy: true

  attr_accessor :forecast, :logged_in_user

  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end

class Station < ApplicationRecord

  belongs_to  :user

    validates :code, presence: true
    validates :user_id, presence: true

end

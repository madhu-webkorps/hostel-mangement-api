class Hostel < ApplicationRecord
    belongs_to :user
    has_many :rooms
    has_many :protocols
		has_many :services

end

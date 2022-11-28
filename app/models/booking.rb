class Booking < ApplicationRecord

  

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :email, presence: true,
    length: {minimum: 5, maxmimum: 105},
    uniqueness: {case_sensitive: false},
    format: { with: VALID_EMAIL_REGEX }

    validates :first_name, :last_name, :contact_no, :guardian_contact_no, :room_no, 
              :guardian_name, :address, :duration, :country, :organization, :addhar_no,
               :presence => true

    
     
    validates  :contact_no, :guardian_contact_no, :numericality => true,
              :length => { :minimum => 10, :maximum => 12 }

    validates  :addhar_no, :numericality => true,
    :length => { :minimum => 12, :maximum => 12 }

    

end

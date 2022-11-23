class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt
  JWT.encode({ id: id,
              exp: 5.days.from_now.to_i },
              Rails.application.secrets.secret_key_base)
end

 has_many :hostels

 def self.fullname
     self.first_name +" "+ self.last_name  
 end
 
end

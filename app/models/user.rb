class User < ActiveRecord::Base
    has_secure_password 
    has_many :films 
    validates :user_name, :email, presence: true 
end
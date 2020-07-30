class User < ActiveRecord::Base
    has_secure_password 
    has_many :films 
    validates :user_name, :email, uniqueness: true, presence: true, format: { without: /\s/ }

end
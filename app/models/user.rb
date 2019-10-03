class User < ApplicationRecord
    has_secure_password
    validates :name,presence:true,length:{maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence:true,length:{maximum:50},
               format:{with:VALID_EMAIL_REGEX}
    validates :password,presence:true,length:{maximum:8}
end

class User < ApplicationRecord
    has_secure_password
    has_many :articles, dependent: :destroy
    validates :username, presence: true ,
    length: { minimum: 3, maximum: 25 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email_id, presence: true,
    uniqueness: { case_sensitive: false }, length: { maximum: 50},
    format: { with: VALID_EMAIL_REGEX, message: 'should be valid'}
    
end

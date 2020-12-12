class User < ApplicationRecord
    validates :username, :password_digest, :email, presence: true
    validates :username, :email, uniqueness: true
end

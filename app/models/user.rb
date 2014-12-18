class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	has_secure_password

	validates :name,  presence: true, length: {minimum: 5, maximum: 50 }
    validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: /.+@.+\..+/i }, uniqueness: true
	validates :password, presence: true, length: { minimum: 4, maximum: 15 }, :confirmation =>true
	
end
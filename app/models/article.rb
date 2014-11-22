class Article < ActiveRecord::Base
	belongs_to :user
	validates_associated :user

	validates :content,  presence: true, length: {minimum: 10 }
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
end
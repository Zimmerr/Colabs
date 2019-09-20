class User < ApplicationRecord

	has_secure_password

	validates :nome, presence: true, length: { maximum: 50 },
																		format: { with: /[a-z]+/i }
	validates :password, confirmation: true, length: { minimum: 6 }
	# This validation with the 'uniqueness' parameter will do the trick for preventing duplication
	validates :email, presence: true
	validates :email, uniqueness: true, :on => :create
end

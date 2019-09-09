class User < ApplicationRecord

	has_secure_password

	validates :nome, presence: true, length: { maximum: 50 },
																		format: { with: /[a-z]+/i }
	validates :password, confirmation: true, length: { minimum: 6 }

end

class User < ApplicationRecord

	validates :password, confirmation: true
	has_secure_password

end

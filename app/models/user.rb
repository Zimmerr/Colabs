class User < ApplicationRecord

	has_secure_password

    scope :search, ->  (search_name) {joins(:projects).where("projects.name like ? or projects.desc like ?", "#{search_name}%", "#{search_name}")}
	validates :nome, presence: true, length: { maximum: 50 },
																		format: { with: /[a-z]+/i }
	validates_length_of :password, minimum: 6, allow_blank: true, :on => :update
	validates :password, confirmation: true, length: { minimum: 6 }, :on => :create
	# This validation with the 'uniqueness' parameter will do the trick for preventing duplication
	validates :email, presence: true
	validates :email, uniqueness: true, :on => :create

	has_many :project_users
	has_many :projects, :through => :project_users

end

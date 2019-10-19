class Project < ApplicationRecord

    scope :search, ->  (user_id, search_name) {joins(:users).where("users.id = ? and projects.name like ? or projects.desc like ?",
                                                                  "#{user_id}", "#{search_name}%", "#{search_name}%" )}
    validates :name, presence: true

    has_many :tasks
    has_many :lists
    has_many :project_users
    has_many :users, :through => :project_users

end

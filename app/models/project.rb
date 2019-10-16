class Project < ApplicationRecord

    validates :name, presence: true

    has_many :tasks
    has_many :lists
    has_many :users, :through => :project_users
    has_many :project_users

end

class List < ApplicationRecord
    validates :name, presence: true
    belongs_to :project

    has_many :tasks

    def isDeletable
        if self.tasks.length > 0
            return false
        else
            return true
        end
    end
end

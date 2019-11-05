include ActiveModel::ForbiddenAttributesProtection

class ProjectUser < ApplicationRecord

    belongs_to :user
    belongs_to :project

end

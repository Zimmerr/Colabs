class Task < ApplicationRecord

  scope :search, ->  (search_name) {joins(:projects).where("projects.name like ? or projects.desc like ?", "#{search_name}%", "#{search_name}")}

  validates :name, presence: true
  validates :desc, presence: true
  validates :project_id, presence: true

end

class Project < ApplicationRecord

	belongs_to :user
	has_many :project_data
	validates :name, {presence: true}
end

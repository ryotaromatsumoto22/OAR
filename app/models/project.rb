class Project < ApplicationRecord

	belongs_to :user
	has_many :project_data, dependent: :destroy
	validates :name, {presence: true}
end

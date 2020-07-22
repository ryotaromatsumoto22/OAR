class Project < ApplicationRecord

	belongs_to :user
	has_many :project_data, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorite_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	validates :name, {presence: true}
end

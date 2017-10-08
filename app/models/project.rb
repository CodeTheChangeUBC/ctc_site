class Project < ActiveRecord::Base
	validates :title,  presence: true
	validates :description, presence: true, 
							length: { minimum: 50, maximum: 2000 }
	validates :year, presence: true, length: { minimum: 4, maximum: 4 }
	mount_uploader :avatar, AvatarUploader

	def picture
		self.avatar? ? self.avatar.url : 'generic_photo.jpg'
	end
end

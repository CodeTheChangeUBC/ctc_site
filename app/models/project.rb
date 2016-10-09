class Project < ActiveRecord::Base
	validates :title,  presence: true
	validates :description, presence: true, 
							length: { minimum: 50, maximum: 2000 }
end

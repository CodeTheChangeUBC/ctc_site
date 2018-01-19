class Post < ApplicationRecord
	validates :title,  presence: true
	validates :text, presence: true, 
							length: { minimum: 50, maximum: 2000 }
	
end

module ApplicationHelper

	# Returns title of individual page if provided, otherwise
	# returns base title
	def full_title(page_title = '')
		base_title = "Code the Change"
		if page_title.empty?
			return base_title
		else 
			return page_title + " - " + base_title
		end
	end
end

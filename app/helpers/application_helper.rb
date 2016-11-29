module ApplicationHelper

	# Returns title of individual page if provided, otherwise
	# returns base title
	def full_title(page_title = '')
		base_title = "Code the Change"
		join = " &middot; ".html_safe
		if page_title.empty?
			return base_title
		else 
			return page_title + join + base_title
		end
	end

	# Returns true iff link is not nil of empty
	def valid_link(link)
		!link.nil? and !link.empty?
	end

end

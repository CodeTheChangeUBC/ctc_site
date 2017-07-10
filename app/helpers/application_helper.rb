module ApplicationHelper

	# Returns title of individual page if provided, otherwise
	# returns base title
	def full_title(page_title = '')
		base_title = "Code the Change UBC"
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

	def markdown(text)
		return unless !text.nil?
	    options = {
	      filter_html:     true,
	      hard_wrap:       true,
	      link_attributes: { rel: 'nofollow', target: "_blank" },
	      space_after_headers: true,
	      fenced_code_blocks: true
	    }

	    extensions = {
	      autolink:           true,
	      superscript:        true,
	      disable_indented_code_blocks: true
	    }

	    renderer = Redcarpet::Render::HTML.new(options)
	    markdown = Redcarpet::Markdown.new(renderer, extensions)

	    markdown.render(text).html_safe
	end


end

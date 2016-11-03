module SessionsHelper

	# Logs in the given member
	def log_in(member)
		session[:member_id] = member.id
	end

	# Remembers a member
	def remember(member)
		member.remember
		cookies.permanent.signed[:member_id] = member.id
		cookies.permanent[:remember_token] = member.remember_token
	end

	# Returns true oif given user is current user
	def current_member?(member)
		member == current_member
	end

	# Returns the current logged-in member (if any).
	def current_member
		if (member_id = session[:member_id])
			@current_member ||= Member.find_by(id: session[:member_id])
		elsif (member_id = cookies.signed[:member_id])
			member = Member.find_by(id: member_id)
			if member && member.authenticated?(cookies[:remember_token])
				log_in member
				@current_member = member
			end
		end
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
	    !current_member.nil?
	end

	# Confirms if current member is an admin
    def admin? 
      (logged_in? && current_member.admin?) ? true : false
    end


	# Logs out the current member
	def log_out
		forget(current_member)
		session.delete(:member_id)
		@current_member = nil
	end

	# For a cookies session
	def forget(member)
		member.forget
		cookies.delete(:member_id)
		cookies.delete(:remember_token)
	end

	# Redirects to stored location (or to the default).
	def redirect_back_or(default)
	  redirect_to(session[:forwarding_url] || default)
	  session.delete(:forwarding_url)
	end

	# Stores the URL trying to be accessed.
	def store_location
	  session[:forwarding_url] = request.original_url if request.get?
	end
end

module SessionsHelper

	# Logs in the given member
	def log_in(member)
		session[:member_id] = member.id
	end

	# Returns the current logged-in member (if any).
	def current_member
	    @current_member ||= Member.find_by(id: session[:member_id])
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
	    !current_member.nil?
	end

	# Logs out the current member
	def log_out
		session.delete(:member_id)
		@current_member = nil
	end
end

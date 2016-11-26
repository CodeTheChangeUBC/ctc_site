require 'test_helper'

class MembersLoginTest < ActionDispatch::IntegrationTest

	def setup
		@member = members(:tester)
	end

end

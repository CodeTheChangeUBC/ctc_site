require 'test_helper'

class MembersControllerTest < ActionController::TestCase

	def setup 
		@admin = members(:admin)
	end
  
  test "should not get new when not admin" do
    get :new
    assert_response :failure
  end

  test "should get new when admin" do
  	log_in_as(@admin)
  	get :new
  	assert_response :success
  end

end

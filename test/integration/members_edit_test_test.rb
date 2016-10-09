require 'test_helper'

class MembersEditTestTest < ActionDispatch::IntegrationTest
  def setup
		@member = members(:tester)
	end

	test "unsuccesful edit due to no name and invalid email address" do 
		log_in_as(@member)
		get edit_member_path(@member)
		assert_template 'members/edit'
		patch member_path(@member), params: { member: { firstName: "", 
		                                		  email: "foo@invalid", 
		                                		  password: "", 
		                                		  password_confirmation: "" } }
 		assert_template 'members/edit'
 	end

 	test "unsuccesful edit due to wrong password confirmation" do 
		log_in_as(@member)
		get edit_member_path(@member)
		assert_template 'members/edit'
		patch member_path(@member), params: { member: { firstName: "valid name", 
		                                		  email: "foo@invalid.com", 
		                                	      password: "foo", 
		                                		  password_confirmation: "notfoo" } }
 		assert_template 'members/edit'
 	end

 	test "successful edit with friendly forwarding" do
 		get edit_member_path(@member)
		log_in_as(@member)
		assert_redirected_to edit_member_path(@member)
 		name  = "Foo Bar"
    	email = "foo@bar.com"
    	patch member_path(@member), params: { member: { firstName:  name,
        	                            	   	  email: email,
           	                            		  password:              "",
               	                        		  password_confirmation: "" } }
    	assert_not flash.empty?
    	assert_redirected_to @member
    	@member.reload
    	assert_equal name,  @member.firstName
    	assert_equal email, @member.email
    	assert_equal nil, session[:forwarding_url]
  	end

end


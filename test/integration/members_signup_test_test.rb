require 'test_helper'

class MemberssSignupTestTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get new_member_path
    assert_no_difference 'Member.count' do
      post members_path, params: { member: { firstName:  "",
                                           email: "user@invalid",
                                           password:              "foo",
                                           password_confirmation: "bar" } }
    end
    assert_template 'members/new'
  end

  test "valid signup information" do
    get new_member_path
    assert_difference 'Member.count', 1 do
      post members_path, params: { member: { firstName:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'members/show'
  end
end

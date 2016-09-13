require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @member = members(:tester)
    remember(@member)
  end

  test "current_member returns right member when session is nil" do
    assert_equal @member, current_member
    assert is_logged_in?
  end

  test "current_member returns nil when remember digest is wrong" do
    @member.update_attribute(:remember_digest, Member.digest(Member.new_token))
    assert_nil current_member
  end
end
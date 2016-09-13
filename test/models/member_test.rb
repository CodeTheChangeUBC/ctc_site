require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @member = Member.new(firstName: "Example", lastName: "User", email: "user@example.com",
             password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do 
  	assert @member.valid?
  end

  test "should be valid without last name" do
    @member.lastName = ""
    assert @member.valid?
  end

  test "name should be present" do
  	@member.firstName = "    "
  	assert_not @member.valid?
  end

  test "email should be present" do
    @member.email = "     "
    assert_not @member.valid?
  end

  test "first name should not be too long" do
    @member.firstName = "a" * 51
    assert_not @member.valid?
  end

  test "last name should not be too long" do
    @member.lastName = "a" * 51
    assert_not @member.valid?
  end


  test "email should not be too long" do
    @member.email = "a" * 244 + "@example.com"
    assert_not @member.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @member.dup
    duplicate_user.email = @member.email.upcase
    @member.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @member.email = mixed_case_email
    @member.save
    assert_equal mixed_case_email.downcase, @member.reload.email
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @member.email = valid_address
      assert @member.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @member.email = invalid_address
      assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "password should be present (nonblank)" do
    @member.password = @member.password_confirmation = " " * 6
    assert_not @member.valid?
  end

  test "password should have a minimum length" do
    @member.password = @member.password_confirmation = "a" * 5
    assert_not @member.valid?
  end

  test "authenticated? should return false for a member with nil digest" do
    assert_not @member.authenticated?('')
  end

end

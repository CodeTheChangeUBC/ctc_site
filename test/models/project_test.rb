require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup 
  	@project = Project.new(title: 'Project', githubPage: 'https://github.com', 
  						   description: "description"*50)
  end

  test "should be valid" do
  	assert @project.valid?
  end

  test "should have title" do
  	@project.title = " "
  	assert_not @project.valid?
  end

  test "should have description of right length" do
  	@project.description = "a" * 49
  	assert_not @project.valid?
  	@project.description = "a" * 2001
  	assert_not @project.valid?
  end
end

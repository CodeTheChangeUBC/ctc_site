# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Make admin
Member.create!(firstName: "Admin", 
			   email: "admin@codethechangeubc.org", 
			   password: "codethechange", 
			   password_confirmation: "codethechange", 
			   admin: true)

# Seed fake projects and members if in development mode
if Rails.env.development? 

	# Seed members
	30.times do |i|
		firstName = "Fake name #{i+1}"
		lastName = "Last name"
		password = "password"
		email = "valid@example#{i+1}.com"
		Member.create!(firstName: firstName, 
					   lastName: lastName, 
					   email: email,
					   password: password, 
					   password_confirmation: password)
	end

	# Seed projects
	10.times do |i|
		title = "Project #{i+1}"
		description = "Project description. " * 30
		githubPage = "https://github.com/Codethechangeubc"
		Project.create!(title: title, 
						description: description, 
						githubPage: githubPage)
	end
end





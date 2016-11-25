# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Make admin
Member.create!(firstName: "Admin", 
			   email: "admin@codethechangeubc.org", 
			   password: ENV["password"], 
			   password_confirmation: ENV["password"], 
			   admin: true)

# Seed fake projects and members if in development mode
if Rails.env.development? 

	# Seed Execs
	10.times do |i|
		firstName = Faker::Name.name
		lastName = ""
		password = "password"
		email = Faker::Internet.email
		Member.create!(firstName: firstName, 
					   lastName: lastName, 
					   email: email,
					   password: password, 
					   password_confirmation: password, 
					   exec: true)
	end


	# Seed members
	10.times do |i|
		firstName = Faker::Name.name
		lastName = ""
		password = "password"
		email = Faker::Internet.email
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





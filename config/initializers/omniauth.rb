# Omniauth Authentication for Github
Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.production?
  		provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "read:org"
  	else 
  		provider :github, ENV['GITHUB_KEY_DEV'], ENV['GITHUB_SECRET_DEV'], scope: "read:org"
  	end
end
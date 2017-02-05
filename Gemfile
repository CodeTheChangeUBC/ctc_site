source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                   '>= 5.0.0.rc2', '< 5.1'
gem 'bcrypt',                  '3.1.11'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~>0.19.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'coffee-script', '~>2.4.1'

gem 'bootstrap-sass', '>=3.3.6'

# Use mailgun-ruby for the mailer
gem 'mailgun-ruby', '~>1.1.3'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~>4.2.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~>5.0.1'
gem 'jquery-turbolinks', '~>2.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Figaro gem for secure API and application information
gem 'figaro', '~>1.1.1'
# Omniauth gem for authentication with GitHub
gem 'omniauth-github', '~>1.1.2'
# To fill up db with fake users in development
gem 'faker',                   '1.6.3'
# For file and image uploading
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'mini_magick',             '4.5.1'
gem 'fog',                     '1.38.0'

# Enable Markdown Rendering
gem 'redcarpet', '~> 3.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug', '~>9.0.6'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
    gem 'rails_12factor', '~>0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

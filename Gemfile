source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg'

gem "quiet_assets"

gem "haml-rails"

gem 'devise'
gem "cancan"
gem "omniauth-twitter"

gem 'delayed_job_active_record'
gem 'delayed_job_web'
gem 'activeadmin', git: "https://github.com/gregbell/active_admin"

gem 'simple_form', git: "https://github.com/plataformatec/simple_form"

#paperclip s3
gem "paperclip", "~> 4.1"
gem 'aws-sdk', '~> 1.5.7'
#carrierwave s3
gem 'carrierwave'
gem 'rmagick', '~> 2.13.2', require: "RMagick"
gem "fog"
#will paginate
gem "kaminari"


  group :development, :test do 
    gem "capybara"
    gem "database_cleaner"
    gem "selenium-webdriver"
    gem "faker"
    gem "rspec-rails"
    gem "factory_girl_rails"
  end

gem 'simplecov', require: false, group: :test

# group development
	group :development do
    gem "letter_opener"
		gem "hirb"
		gem "interactive_editor"
		gem "awesome_print"
	end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

#bootstrap
gem "bootstrap-sass", "~> 3.1.1"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'  # Use devise to handle user authentication

gem "haml"
gem "haml-rails", "~> 0.9"
gem 'bootstrap-sass'
gem 'closure_tree'

gem 'pg'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do 
  gem 'puma' # use Puma web server in production
end

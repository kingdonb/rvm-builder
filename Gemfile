source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rubycritic'

# manage secrets with dotenv
gem 'dotenv-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'

# Use oracle as the database for Active Record
gem 'activerecord-oracle_enhanced-adapter'
gem 'ruby-oci8', require: 'oci8'
gem 'ruby-plsql'
gem 'composite_primary_keys', '~> 12.0'

# Use ".to_dot" to give dot-access semantic to a Hash
gem 'hash_dot'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'awesome_print', require: 'ap'
  gem 'rspec-rails', '~> 4.0'
  gem 'rspec_junit_formatter'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'pg' # postgresql for easier local testing
  gem 'shoulda-matchers'
end

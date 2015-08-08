source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] if ENV['CUSTOM_RUBY_VERSION']

gem 'rails'
gem 'pg'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'sdoc', group: :doc

gem 'mechanize', require: false
gem 'slim-rails'

group :development do
  gem 'spring'
  gem 'html2slim', github: 'slim-template/html2slim'
end

group :production do
  gem 'rails_12factor'
  gem 'exception_notification'
end

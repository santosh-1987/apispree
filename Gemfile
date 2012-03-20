source 'http://rubygems.org'

gem "spree", :path => File.dirname(__FILE__)
gem 'spree_cmd'
#gem 'spree', '0.60.4'
gem 'sqlite3-ruby'

gemspec

group :test do
  gem 'rspec-rails', '= 2.5.0'
  gem 'factory_girl_rails'
  gem 'factory_girl', '= 1.3.3'
  gem 'simplecov'
  gem 'shoulda'
  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'database_cleaner', '= 0.6.7'
  gem 'nokogiri'
  gem 'capybara', '= 0.4.1.2'
  gem 'faker'
  gem 'launchy'

  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end
#gem 'spree', :git => 'git://github.com/spree/spree.git'

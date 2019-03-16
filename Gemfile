source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails_12factor', group: :production
gem 'rails', '~> 5.2'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'fast_jsonapi'
gem 'devise'
gem 'jwt'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rubocop', '~> 0.48.0'
  gem 'factory_bot'
  gem 'rspec-rails', '~> 3.8'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

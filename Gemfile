source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.2"
gem "sass-rails", "~> 5.0"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 1.3.0"

gem "image_processing", "~> 1.2"
gem "jquery-rails", "4.2"
gem "redcarpet"
gem "simple_form"
gem "sitemap_generator", "6.0.1"
gem "slim-rails"
gem "whenever"

gem "turbolinks", "~> 5"

group :development, :test do
  gem "pry"
  # gem 'capybara', '~> 2.13'
  # gem 'selenium-webdriver'
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

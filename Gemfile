source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#ruby '2.6.5'


gem 'rails', '~> 5.2.5'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
#gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# ログイン機能&日本語化
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n'

# 写真機能
gem 'mini_magick'  
gem 'image_processing', '~> 1.2'
gem "aws-sdk-s3", require: false
gem 'dotenv-rails'

# ページネーション
gem 'kaminari'

# Webをリッチにする為のgem
gem 'font-awesome-sass'

#検索機能
gem 'ransack'

#管理者権限
gem 'cancancan'
gem 'rails_admin'

#seedデータ
gem 'faker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

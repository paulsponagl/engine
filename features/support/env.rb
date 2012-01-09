# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

ENV['RAILS_ENV'] ||= 'test'

require 'cucumber/rails'
require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/rspec'
require 'cucumber/rails/world'

require 'capybara'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'

require 'resolv'
require 'uri'

def ensure_host_resolution(app_host)
  hosts = Resolv::Hosts.new
  app_host_name = URI.parse(app_host).host
  begin
    hosts.getaddress(app_host_name)
  rescue Resolv::ResolvError
    raise "Unable to resolve ip address for #{app_host_name}. Please consider adding an entry to '/etc/hosts' that associates #{app_host_name} with '127.0.0.1'."
  end
end

Capybara.configure do |config|
  config.default_selector   = :css
  config.server_port        = 9886
  config.app_host           = 'http://test.example.com:9886'

  ensure_host_resolution(config.app_host)
end

# Capybara.javascript_driver = :rack_test

# Stop endless errors like
# ~/.rvm/gems/ruby-1.9.2-p0@global/gems/rack-1.2.1/lib/rack/utils.rb:16:
# warning: regexp match /.../n against to UTF-8 string
# more information here: https://github.com/jnicklas/capybara/issues/243
$VERBOSE = nil

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

require File.expand_path(File.dirname(__FILE__) + '/../../spec/support/carrierwave')
require File.expand_path(File.dirname(__FILE__) + '/../../spec/support/locomotive')

Locomotive.configure_for_test(true)

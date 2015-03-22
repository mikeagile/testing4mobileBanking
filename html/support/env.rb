require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara-screenshot'
require File.expand_path('../config', __FILE__)
include CustomConfig


require_relative '../pages/generic_page'

Capybara.run_server = false
Capybara.save_and_open_page_path = "screenshots"
Capybara.default_wait_time = 5
Capybara.default_selector = :css
Capybara.app_host = CustomConfig::host
Capybara.configure do |config|
  config.match = :first
  config.exact_options = false
  config.ignore_hidden_elements = false
  config.visible_text_only = false
end

$global_count_images = 1

def takepicture(name)
  sleep 1
  page.save_screenshot("screenshots/#{name}_#$global_count_images.png")
  embed("screenshots/#{name}_#$global_count_images.png", "image/png", "#{name}")
  $global_count_images=$global_count_images+1
end

#Url for testing
$url_app = "http://localhost/apps/index.html"
if ENV['URL'] != nil
  $url_buzz_html =  ENV['URL']
end

#Config BROWSER
browser = CustomConfig::browser
case browser
  
  when :firefox
    Capybara.default_driver = :selenium
  else
    Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,:browser => :chrome)
  end
  Capybara.default_driver = :selenium
end
window = Capybara.current_session.driver.browser.manage.window
window.resize_to(375,667)




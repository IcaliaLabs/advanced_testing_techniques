# frozen_string_literal: true

require 'selenium/webdriver'

# Silence the annoying "Capybara starting Puma..." message on tests:
Capybara.server = :puma, { Silent: true }

# The default 'selenium_chrome_headless' capybara driver lacks the 'no-sandbox'
# option, and crashes when run inside the development container:
Capybara.register_driver :chrome_headless do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 100
  client.open_timeout = 100

  chrome_options = %w[
    headless disable-gpu no-sandbox disable-dev-shm-usage window-size=1400,1400
  ]
  chrome_binary = ENV.fetch 'CHROME_PATH', '/usr/bin/chromium'

  options = Selenium::WebDriver::Chrome::Options.new args: chrome_options,
                                                     binary: chrome_binary

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 options: options,
                                 http_client: client
end

RSpec.configure do |config|
  # For "normal" system tests (i.e. no javascript UI, etc) use the :rack_test
  # driver:
  config.before :example, type: :system do
    driven_by :rack_test
  end

  # For system tests involving javascript use the :chrome_headless driver:
  config.before :example, type: :system, js: true do
    driven_by :chrome_headless
  end
end

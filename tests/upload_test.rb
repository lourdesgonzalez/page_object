require 'watir'
require 'pry'
require 'rspec'
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/upload_page.rb"

class UploadTest
  include RSpec::Matchers

  # testing "Seleccionar archivo" button functionality
  def test_upload_file
    driver = Driver.new
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.upload_link.click
    context = Upload.new(context.browser)
    file = File.expand_path('../sample.pdf', File.dirname(__FILE__))
    context.select_file.set(file)
    context.upload_button.click
    expect(context.uploaded_files.text).to eq('sample.pdf')
    context.browser.close
    context.browser.quit
  end

  def unsuccessful_login
    driver = Driver.new
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.upload_link.click
    context = Upload.new(context.browser)
    context.upload_button.click
    expect(context.internal_error.present?).to be(true)
    context.browser.close
    context.browser.quit
  end
end

test1 = UploadTest.new
test1.test_upload_file
test1.unsuccessful_login

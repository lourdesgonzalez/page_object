require 'watir'
require 'pry'
require 'rspec'
require 'rspec/expectations'
require '../support/driver.rb'
require '../pages/base.rb'
require '../pages/main.rb'
require '../pages/checkboxes_page.rb'

class CheckboxesTest
  include RSpec::Matchers

  def caso_1
    driver = Driver.new 
    context = Main.new(driver.new_browser)  # le paso este argumento porque hereda el initialize de basepage. 
    context.go_to('https://the-internet.herokuapp.com/')
    context.checkboxes_link.click 
    context = Checkboxes.new(context.browser)
    context.checkbox_1.click
    expect(context.checkbox_1.attribute_list.include?(:checked)).to be(true)
    context.browser.close
    context.browser.quit
  end
  
  def caso_2
    driver = Driver.new 
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.checkboxes_link.click 
    context = Checkboxes.new(context.browser)
    context.checkbox_2.click
    expect(!(context.checkbox_2.attribute_list.include?(:checked))).to be(true)
    context.browser.close
    context.browser.quit
  end
end

test = CheckboxesTest.new
test.caso_1
test.caso_2 

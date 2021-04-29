require 'watir'
require 'pry'
require 'rspec'
require 'rspec/expectations'
require '../support/driver.rb'
require '../pages/base.rb'
require '../pages/main.rb'
require '../pages/hovers_page.rb'

class HoversTest
  include RSpec::Matchers

  def caso_1
    driver = Driver.new 
    context = Main.new(driver.new_browser)   
    context.go_to('https://the-internet.herokuapp.com/')   
    context.hovers_link.click
    context = Hovers.new(context.browser)
    context.first_image.hover
    expect(context.first_user.present?).to be(true)
    expect(context.view_profile_link_us1.present?).to be(true)
    context.second_image.hover
    expect(context.second_user.present?).to be(true)
    expect(context.view_profile_link_us2.present?).to be(true)
    context.third_image.hover
    expect(context.third_user.present?).to be(true)
    expect(context.view_profile_link_us3.present?).to be(true)
  end 

  def caso_2
    driver = Driver.new 
    context = Main.new(driver.new_browser)   
    context.go_to('https://the-internet.herokuapp.com/')   
    context.hovers_link.click
    context = Hovers.new(context.browser)
    context.first_image.hover
    expect(context.first_user.present?).to be(true)
    expect(context.view_profile_link_us1.present?).to be(true)
    context.view_profile_link_us1.click
    expect(context.error.present?).to be(true)
  end

  def caso_3
    driver = Driver.new 
    context = Main.new(driver.new_browser)   
    context.go_to('https://the-internet.herokuapp.com/')   
    context.hovers_link.click
    context = Hovers.new(context.browser)
    context.second_image.hover
    expect(context.second_user.present?).to be(true)
    expect(context.view_profile_link_us2.present?).to be(true)
    context.view_profile_link_us2.click
    expect(context.error.present?).to be(true)
  end 

  def caso_4
    driver = Driver.new 
    context = Main.new(driver.new_browser)   
    context.go_to('https://the-internet.herokuapp.com/')   
    context.hovers_link.click
    context = Hovers.new(context.browser)
    context.third_image.hover
    expect(context.third_user.present?).to be(true)
    expect(context.view_profile_link_us3.present?).to be(true)
    context.view_profile_link_us3.click
    expect(context.error.present?).to be(true)
  end
end 

test_hovers = HoversTest.new
test_hovers.caso_1
test_hovers.caso_2
test_hovers.caso_3
test_hovers.caso_4







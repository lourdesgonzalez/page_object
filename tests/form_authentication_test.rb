require 'watir'
require 'pry'
require 'rspec'
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/form_authentication_page.rb"

class FormAuthenticationTest
    include RSpec::Matchers

    def caso_1
        driver = Driver.new 
        context = Main.new(driver.new_browser)   
        context.go_to('https://the-internet.herokuapp.com/')   
        context.form_authentication_link.click
        context = FormAuthentication.new(context.browser)
        context.enabled_input_username.send_keys('tomsmith')
        context.enabled_input_password.send_keys('SuperSecretPassword!')
        context.login_button.click
        expect(context.expected_text.present?).to be(true)
        context.browser.close
        context.browser.quit
    end

    def caso_2
        driver = Driver.new 
        context = Main.new(driver.new_browser)   
        context.go_to('https://the-internet.herokuapp.com/')   
        context.form_authentication_link.click
        context = FormAuthentication.new(context.browser)
        context.login_button.click
        expect(context.invalid_text.present?).to be(true)  
        context.browser.close
        context.browser.quit
    end
    
    def caso_3
        driver = Driver.new 
        context = Main.new(driver.new_browser)   
        context.go_to('https://the-internet.herokuapp.com/')   
        context.form_authentication_link.click
        context = FormAuthentication.new(context.browser)
        context.enabled_input_username.send_keys('lourdes')
        context.enabled_input_password.send_keys('SuperSecretPassword!')
        context.login_button.click
        expect(context.invalid_text.present?).to be(true)
        context.browser.close
        context.browser.quit
    end

    def caso_4
        driver = Driver.new 
        context = Main.new(driver.new_browser)   
        context.go_to('https://the-internet.herokuapp.com/')   
        context.form_authentication_link.click
        context = FormAuthentication.new(context.browser)
        context.enabled_input_username.send_keys('tomsmith')
        context.enabled_input_password.send_keys('lourdes')
        context.login_button.click
        expect(context.invalid_text.present?).to be(true)
        context.browser.close
        context.browser.quit
    end 
end 

test_form_authentication = FormAuthenticationTest.new
test_form_authentication.caso_1
test_form_authentication.caso_2
test_form_authentication.caso_3
test_form_authentication.caso_4
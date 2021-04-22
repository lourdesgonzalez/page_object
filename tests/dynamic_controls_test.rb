require 'watir'
require 'pry'
require 'rspec'
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/dynamic_controls_page.rb"

class DynamicControlsTest
    include RSpec::Matchers

    def caso_1
        driver = Driver.new 
        context = Main.new(driver.new_browser)  
        context.go_to('https://the-internet.herokuapp.com/')
        context.dynamic_controls_link.click
        context = DynamicControls.new(context.browser)          
        context.checkbox.click
    end 

    def caso_2
        driver = Driver.new 
        context = Main.new(driver.new_browser)  
        context.go_to('https://the-internet.herokuapp.com/')
        context.dynamic_controls_link.click
        context = DynamicControls.new(context.browser) 
        context.remove_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)  
        expect(context.checkbox.present?).to be(false)
        expect(context.add_button.present?).to be(true)
        context.browser.close
        context.browser.quit                     
    end

    def caso_3
        driver = Driver.new 
        context = Main.new(driver.new_browser)  
        context.go_to('https://the-internet.herokuapp.com/')
        context.dynamic_controls_link.click
        context = DynamicControls.new(context.browser) 
        context.remove_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)
        context.add_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)
        expect(context.remove_button.present?).to be(true)
        expect(context.checkbox.present?).to be(true)
        expect(context.message.present?).to be(true)
        context.browser.close
        context.browser.quit
    end

    def caso_4
        driver = Driver.new 
        context = Main.new(driver.new_browser)  
        context.go_to('https://the-internet.herokuapp.com/')
        context.dynamic_controls_link.click
        context = DynamicControls.new(context.browser)
        expect(context.enabled_input.attribute_list.include?(:disabled)).to be(true)
        context.enable_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)
        expect(context.enabled_input.attribute_list.include?(:disabled)).to be(false)
        expect(context.disable_button.present?).to be(true)  
        context.browser.close
        context.browser.quit
    end 

    def caso_5 #check Disable button functionality
        driver = Driver.new 
        context = Main.new(driver.new_browser)  
        context.go_to('https://the-internet.herokuapp.com/')
        context.dynamic_controls_link.click
        context = DynamicControls.new(context.browser)
        context.enable_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)
        expect(context.enabled_input.attribute_list.include?(:disabled)).to be(false)
        context.disable_button.click
        context.loading.wait_until(&:present?)
        context.loading.wait_while(&:present?)
        expect(context.enable_button.present?).to be(true)
        expect(context.enabled_input.attribute_list.include?(:disabled)).to be(true)
        context.browser.close
        context.browser.quit
    end
end 

test1 = DynamicControlsTest.new
test1.caso_1
test1.caso_2
test1.caso_3
test1.caso_4
test1.caso_5




        
        

        



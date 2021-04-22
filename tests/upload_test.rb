require 'watir'
require 'pry'
require 'rspec'
#require "selenium-webdriver"
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/upload_page.rb"

class UploadTest
    #include RSpec::Matchers
    #include Watir::FileField

    def caso_1 #testing "Seleccionar archivo" button functionality
        driver = Driver.new 
        context = Main.new(driver.new_browser)
        context.go_to('https://the-internet.herokuapp.com/')
        context.upload_link.click
        context = Upload.new(context.browser)
        binding.pry
      context.select_file.set('C:\Users\LULI\Desktop\CURSO DE PROGRAMACION\testing\herokutests\page_object\sample.pdf')
       #File.dirname(__FILE__)
       #.set(File.expand_path(File.new("./fixtures/credit_report.html")))
        #context.select_file.set(File.expand_path(File.new("./sample.pdf")))
    end

    def caso_2
        driver = Driver.new 
        context = Main.new(driver.new_browser)
        context.go_to('https://the-internet.herokuapp.com/')
        context.upload_link.click
        context = Upload.new(context.browser)
    end



    def caso_4 #unsuccesful login 
        driver = Driver.new 
        context = Main.new(driver.new_browser)
        context.go_to('https://the-internet.herokuapp.com/')
        context.upload_link.click
        context = Upload.new(context.browser)
        context.upload_button.click
        expect(context.internal_error.present?).to be(true)
        context.close
        context.quit
    end 

    def caso_5 #uploading files using the box
        driver = Driver.new 
        context = Main.new(driver.new_browser)
        context.go_to('https://the-internet.herokuapp.com/')
        context.upload_link.click
        context = Upload.new(context.browser)
        context.box_drag_and_drop.click
        expect(context.window(text: 'herokutests').present?).to be(true)
    end
end

test1 = UploadTest.new
test1.caso_1

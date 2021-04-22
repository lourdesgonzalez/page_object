require 'watir'
require 'pry'
require 'rspec'
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/dropdown_page.rb"

class DropdownTest
    include RSpec::Matchers

    def caso_1
        driver = Driver.new 
        context = Main.new(driver.new_browser)  #ahorro pasos instanciando main directamente. 
        context.go_to('https://the-internet.herokuapp.com/')   #uso context porq main ya hereda de basepage el cual abre el navegador y puedo llamar a goto
        context.dropdown_link.click
        context = Dropdown.new(context.browser)          #dropdown hereda de basepage, entonces paso como argumento abrir el mismo navegador
        context.dropdown_list.click
        expect(context.option_one.present?).to be(true)
        expect(context.option_two.present?).to be(true)
        context.browser.close
        context.browser.quit
    end

    def caso_2
        driver = Driver.new 
        context = Main.new(driver.new_browser) 
        context.go_to('https://the-internet.herokuapp.com/') 
        context.dropdown_link.click
        context = Dropdown.new(context.browser) #llamo al metodo browser para abrir el mismo navegador y pongo context porque browser es un metodo de la clase basepage que esta encapsulada dentro de la instancia de main. 
        context.option_one.click
        expect(context.option_one.attribute_list.include?(:selected)).to be(true)
        context.option_two.click
        expect(context.option_two.attribute_list.include?(:selected)).to be(true)
        context.browser.close
        context.browser.quit
    end
end 

test_dropdown = DropdownTest.new
#test_dropdown.caso_1
test_dropdown.caso_2





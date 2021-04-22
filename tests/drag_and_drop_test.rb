require 'watir'
require 'pry'
require 'rspec'
require "rspec/expectations"
require "../support/driver.rb"
require "../pages/base.rb"
require "../pages/main.rb"
require "../pages/drag_and_drop_page.rb"

class DragAndDropTest
    include RSpec::Matchers

    def caso_1
        driver = Driver.new 
        context = Main.new(driver.new_browser)
        context.go_to('https://the-internet.herokuapp.com/')
        context.drag_and_drop_link.click
        context = DragAndDrop.new(context.browser)
        binding.pry
        context.square_a.drag_and_drop_on context.square_b
    end
end

test1 = DragAndDropTest.new
test1.caso_1
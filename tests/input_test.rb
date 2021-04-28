require 'watir'
require 'pry'
require 'rspec'
require 'rspec/expectations'
require '../support/driver.rb'
require '../pages/base.rb'
require '../pages/main.rb'
require '../pages/input_page.rb'

class InputsTest
  include RSpec::Matchers

  def caso_1 # check enabled input
    driver = Driver.new 
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.inputs_link.click
    context = Inputs.new(context.browser)
    context.input.send_keys(85)
    expect(context.input.value).to eq('85') 
    context.browser.close
    context.browser.quit
  end

  def caso_2
    driver = Driver.new 
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.inputs_link.click
    context = Inputs.new(context.browser)
    context.input.click 
    flag = 0
    while flag < 6
     context.input.send_keys :arrow_up
     flag = flag + 1  
    end
    expect(context.input.value).to eq('6')
    context.browser.close
    context.browser.quit
  end

  def caso_3
    driver = Driver.new 
    context = Main.new(driver.new_browser)
    context.go_to('https://the-internet.herokuapp.com/')
    context.inputs_link.click
    context = Inputs.new(context.browser)
    context.input.click
    flag = 0
    while flag < 6  #estos numeros representan veces.
      context.input.send_keys :arrow_down
      flag = flag + 1  
    end
    expect(context.input.value).to eq('-6')
    context.browser.close
    context.browser.quit
  end
end

test1 = InputsTest.new
test1.caso_1
test1.caso_2
test1.caso_3

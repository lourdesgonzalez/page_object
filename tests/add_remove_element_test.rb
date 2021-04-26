require 'watir'
require 'pry'
require 'rspec'
require 'rspec/expectations'
require '../support/driver.rb'
require '../pages/base.rb'
require '../pages/main.rb' #necesito requerirlos para usar sus metodos.
require '../pages/add_remove_element_page.rb'

class AddRemoveElementTests
  include RSpec::Matchers

  def caso_1
    driver = Driver.new  #le asigno a una variable el objeto de la clase browser.
    context = Main.new(driver.new_browser)  # le paso este argumento porque hereda el initialize de basepage.
    context.go_to('https://the-internet.herokuapp.com/')
    context.add_remove_elements_link.click
    context = AddRemoveElement.new(context.browser)  # le paso un nuevo argumento para el parametro de initialize?
    context.add_element_button.click
    expect(context.delete_button.present?).to be(true)
    context.browser.close
    context.browser.quit #si yo en lina 20 pongo de nuevo driver.new_browser me abre un nuevo navegador?
  end

  def caso_2
    driver = Driver.new  #le asigno a una variable el objeto de la clase browser. #creo un navegador.
    context = Main.new(driver.new_browser)  # le paso este argumento porque hereda el initialize de basepage.
    context.go_to('https://the-internet.herokuapp.com/')
    context.add_remove_elements_link.click #metodo q devuelve un elemento que necesitamos y sobre eso ejecutamos el metodo.click
    context = AddRemoveElement.new(context.browser)  #.browser es el metodo creado para usar el @browser de la clase base.
    context.add_element_button.click
    context.delete_button.click
    expect(context.delete_button.present?).to be(false)
    context.browser.close
    context.browser.quit
  end
end

test1 = AddRemoveElementTests.new
test1.caso_1
test1.caso_2

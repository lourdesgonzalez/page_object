class BasePage
    attr_reader :browser  #uso esto para que la variable de browser inicializada, la pueda usar como metodo. 

    def initialize(browser) # si no le paso un argumento, el objeto no se crea. 
        # binding.pry 
        @browser = browser 
    end

    def go_to(url)
        # binding.pry
        @browser.goto(url) 
    end

end 

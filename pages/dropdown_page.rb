class Dropdown < BasePage           #hereda de basepage para llamar al mismo navegador y url. 
    def dropdown_list
        @browser.select(id: 'dropdown')
    end 

    def option_one
        @browser.option(index: 1)
    end 

    def option_two
        @browser.option(index: 2)
    end
end 
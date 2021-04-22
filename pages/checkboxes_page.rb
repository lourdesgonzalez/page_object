class Checkboxes < BasePage        #por que hereda de basepage y no de main?
    def checkbox_1 
        @browser.input(index: 0)
    end

    def checkbox_2
        @browser.input(index: 1)
    end
end 

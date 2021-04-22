class Inputs < BasePage
    def input
        @browser.input(type: 'number')
    end
end
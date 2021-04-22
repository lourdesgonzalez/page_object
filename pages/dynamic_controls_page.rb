class DynamicControls < BasePage
    def checkbox
        @browser.input(type: 'checkbox')
    end 

    def remove_button
        @browser.button(text: 'Remove')
    end
    
    def loading
        # @browser.div(id: 'loading')
        @browser.img(src: "/img/ajax-loader.gif")
    end

    def add_button
        @browser.button(text: 'Add')
    end 

    def enable_button
        @browser.button(text: 'Enable')
    end 

    def disable_button
        @browser.button(text: 'Disable')
    end

    def message
        @browser.p(text: 'It\'s back!')
    end 

    def enabled_input
        @browser.input(type: 'text')
    end 
end 
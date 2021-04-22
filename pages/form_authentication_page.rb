class FormAuthentication < Main
    def enabled_input_username
        @browser.input(id: 'username')
    end
    
    def enabled_input_password
        @browser.input(id: 'password')
    end 

    def login_button
        @browser.button(class: 'radius')
    end

    def expected_text
        @browser.h4(text: 'Welcome to the Secure Area. When you are done click logout below.')
    end

    def invalid_text
        @browser.div(id: 'flash')
    end
end 


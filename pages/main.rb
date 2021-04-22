class Main < BasePage 
    def add_remove_elements_link
        # binding.pry
        @browser.a(text: "Add/Remove Elements")
    end

    def checkboxes_link
        @browser.a(text: "Checkboxes")
    end

    def dropdown_link
        @browser.a(text: 'Dropdown')
    end

    def dynamic_controls_link
        @browser.a(text: 'Dynamic Controls')
    end

    def form_authentication_link
        @browser.a(text: 'Form Authentication')
    end

    def hovers_link
        @browser.a(text: 'Hovers')
    end

    def drag_and_drop_link
        @browser.a(text: 'Drag and Drop')
    end 

    def inputs_link
        @browser.a(text: 'Inputs')
    end

    def upload_link
        @browser.a(text: 'File Upload')
    end
end



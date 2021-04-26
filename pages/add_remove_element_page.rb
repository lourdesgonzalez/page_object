class AddRemoveElement < Main
    def add_element_button
        @browser.button(text: "Add Element")
    end
    
    def delete_button
        @browser.button(text: "Delete")
    end 
end 

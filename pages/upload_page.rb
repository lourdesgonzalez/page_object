class Upload < BasePage
    def select_file
        @browser.file_field(id: "file-upload")
    end

    def upload_button
        @browser.input(class: 'button')
    end 

    def box_drag_and_drop
        @browser.div(id: 'drag-drop-upload')
    end

    def internal_error
        @browser.h1(text: 'Internal Server Error')
    end
end 
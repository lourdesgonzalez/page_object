class DragAndDrop < BasePage
    def square_a
        @browser.div(id: 'column-a')
    end

    def square_b
        @browser.div(id: 'column-b')
    end
end
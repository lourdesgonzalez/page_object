class Hovers < Main
    def first_image
        @browser.img(index: 1)
    end

    def second_image
        @browser.img(index: 2)
    end

    def third_image
        @browser.img(index: 3)
    end

    def first_user
        @browser.h5(index: 0)
    end

    def second_user
        @browser.h5(index: 1)
    end 

    def third_user
        @browser.h5(index: 2)
    end 

    def view_profile_link_us1
        @browser.a(index: 1)
    end

    def view_profile_link_us2
        @browser.a(href: '/users/2')
    end 

    def view_profile_link_us3
        @browser.a(href: '/users/3')
    end 
    
    def error
        @browser.h1(text: 'Not Found')
    end 
end
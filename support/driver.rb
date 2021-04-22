class Driver                #creo una clase para instanciar el navegador que me permite usar watir con sus clases y funciones.
    def new_browser          #metodo en donde instancio el navegador. 
        # binding.pry 
        Watir::Browser.new   #me da el objeto con el que yo puedo navegar. 
    end
end 


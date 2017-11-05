Nodo = Struct.new(:valor, :siguiente, :anterior)

class Lista
    attr_accessor :cabeza, :cola, :size
    
    def initialize
        @cabeza = nil
        @cola = nil
        @size = 0
    end 
end 

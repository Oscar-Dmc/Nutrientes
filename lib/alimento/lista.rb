Nodo = Struct.new(:valor, :siguiente, :anterior) 

class Lista
    attr_accessor :cabeza, :cola, :size
    
    def initialize
        @cabeza = nil
        @cola = nil
        @size = 0
    end 
    
    def insertar_cabeza(nodo)
        if vacia
            nodo[:siguiente] = nil
            nodo[:anterior] = nil
            @cabeza = nodo
            @cola = nodo
        else
            nodo[:siguiente] = @cabeza
            @head[:anterior] = nodo
            nodo[:anterior] = nil
            @cabeza = nodo
        end
        @size = @size + 1 
    end
    
    def vacia
        if size==0
            true
        else 
            false
        end
    end 
end 

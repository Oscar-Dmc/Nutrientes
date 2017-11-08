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
            @cabeza[:anterior] = nodo
            nodo[:anterior] = nil
            @cabeza = nodo
        end
        @size = @size + 1 
    end
    
    def insertar_cola(nodo)
        if vacia
            nodo[:siguiente] = nil
            nodo[:anterior] = nil
            @cabeza = nodo
            @cola = nodo
        else 
            nodo[:siguiente] = nil
            nodo[:anterior] = @cola
            @cola[:siguiente] = nodo
            @cola = nodo
        end
        @size = @size + 1
    end
    
    def insertar_pos(nodo, indice)
        pos =  0
        aux = @cabeza
        if (indice - 1) == 0
            insertar_cabeza(nodo)
            indice = 0

        end
        if indice - 1  > 0
            #Mientras no estemos en la posicion deseada y tengamos siguiente
            while(pos != (indice - 1) && (aux.siguiente != nil))
                if pos == (indice - 2)
                    nodo[:siguiente] = aux.siguiente
                    nodo[:anterior] = aux
                    aux[:siguiente] = nodo
                    pos = pos + 1 
                end
                if pos == (indice - 1)
                    aux = nodo.siguiente
                    aux[:anterior] = nodo
                else
                    pos = pos + 1
                    aux = aux.siguiente
                end
            end
            @size = @size + 1
        else
            error = "La posicion se encuentra fuera de rango"
            error
        end
    end
    
    def insertar_mul(nodos, indice)
        for i in 0.. (nodos.length - 1)
            insertar_pos(nodos[i], indice)
            indice = indice + 1;
        end 
    end
    
    def extrae_cabeza
        if !vacia
            if @cabeza == @cola
                aux = @cabeza
                @cabeza = nil
                @cola = nil
            else
                aux = @cabeza
                @cabeza = @cabeza.siguiente
                @cabeza[:anterior] = nil
            end 
            @size = @size - 1
            aux
        end
    end 
    
    def extrae_cola
        if !vacia
            if @cola == @cabeza
                aux = @cola
                @cabeza = nil
                @cola = nil
            else
                aux = @cola
                @cola = @cola.anterior
                @cola[:siguiente] = nil
            end 
            @size = @size - 1
            aux
        end
    end
    
    def extrae_pos(indice)
        if !vacia
            pos = 0
            aux = @cabeza
            if indice - 1 == 0
                aux = extrae_cabeza
            end
            if indice == size
                aux = extrae_cola
            end
            if indice - 1 > 0 &&  indice < size 
                while pos !=  indice - 1
                  pos = pos + 1
                  aux = aux.siguiente
                end
                auxAnt = aux.anterior
                auxSig = aux.siguiente
                auxAnt[:siguiente] = auxSig
                auxSig[:anterior] = auxAnt
                @size = @size - 1
            end 
        end
        aux
    end
    
    def to_s
        aux = @cabeza
        s = ""
        while aux.siguiente != nil
            s += aux.valor.to_s + "\n"
            aux =  aux.siguiente
        end
        s += aux.valor.to_s
        
    end 
    
    def vacia
        if size==0
            true
        else 
            false
        end
    end 
end 

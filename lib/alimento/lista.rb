#@note Nodos para la lista que contendrá un valor, el nodo siguiente y el anterior enlazados.
Nodo = Struct.new(:valor, :siguiente, :anterior) 

class Lista
    attr_accessor :cabeza, :cola, :size
    include Enumerable
    
    #@note Constructor de la clase lista 
    def initialize
        @cabeza = nil
        @cola = nil
        @size = 0
    end 
    
    #@note Método para insertar un elemento por la cabeza de la lista
    #@param Recibe como parámetro el nodo que queremos insertar. 
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
    
    #@note Método para insertar un elemento por la cola de la lista
    #@param Recibe como parámetro el nodo que queremos insertar. 
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
    
    #@note Método para insertar un elemento en una posición determinada de la lista.
    #@param Recibe como parámetro el nodo [nodo] que queremos insertar y la posición [Number] que ocupará. 
    def insertar_pos(nodo, indice)
        pos =  0
        aux = @cabeza
        if (indice - 1) == 0
            insertar_cabeza(nodo) # Si la posición es 0, es lo mismo que insertar por la cabeza.
            indice = 0

        end
        if indice - 1  > 0
            #Mientras no estemos en la posición deseada y tengamos siguiente.
            while(pos != (indice - 1) && (aux.siguiente != nil))
                if pos == (indice - 2) # Paramos una posición antes para poder hacer las conexiones anteriores.
                    nodo[:siguiente] = aux.siguiente
                    nodo[:anterior] = aux
                    aux[:siguiente] = nodo
                    pos = pos + 1 
                end
                if pos == (indice - 1) # Terminamos de realizar las conexiones. 
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
    
    #@note Método para insertar varios elementos a partir de una determinada posición de la lista
    #@param Recibe como parámetro el array de nodos[nodo[]] que queremos insertar y la posición desde la que se insertarán. 
    def insertar_mul(nodos, indice)
        for i in 0.. (nodos.length - 1)
            insertar_pos(nodos[i], indice) # Vamos llamando a la función insertar por posición y le pasamos el nodo y aumentando la pos. 
            indice = indice + 1;
        end 
    end
    
    #@note Método para la extracción del primer elemento de la lista.
    #@return Se devuelve y elimina el nodo situado en la primera posición de la lista. 
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
    
    #@note Método para la extracción del último elemento de la lista.
    #@return Se devuelve y extrae el nodo situado en la última posición de la lista. 
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
    
    #@note Método para la extracción del nodo situado en la posición determinada.
    #@param Posición del nodo deseado para la extracción [Number].
    #@return Se devuelve y extrae el nodo situado en la posición deseada. 
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
                #Cuando encontramos la posición tenemos que hacer los enlaces para que la lista siga funcionando después de la extracción.
                auxAnt = aux.anterior
                auxSig = aux.siguiente
                auxAnt[:siguiente] = auxSig
                auxSig[:anterior] = auxAnt
                @size = @size - 1
            end 
        end
        aux
    end
    
    #@note Función para mostrar el contenido de la lista. 
    #@return Lista formateada en una cadena para su visualización. 
    def to_s
        aux = @cabeza
        s = ""
        while aux.siguiente != nil
            s += aux.valor.to_s + "\n"
            aux =  aux.siguiente
        end
        s += aux.valor.to_s
        
    end 
    
    #@note Método para comprobar si la lista se encuentra vacía.
    #@return Verdadero en el caso de que la lista no contenga ningún elemento, falso en caso contrario. 
    def vacia
        if size==0
            true
        else 
            false
        end
    end
    
    #@note Método sobrecargado para el correcto funcionamiento del módulo enumerable
    def each
        aux = @cabeza
        while aux != nil
            yield aux.valor
            aux = aux.siguiente
        end 
    end
    
    #@note Método para convertir una lista a un array. 
    #@param lista[Lista]
    #@return [Array]
    def convertArray lista
        lista.map { |x| x}
    end 
    
    #@note Método para ordenar un array creado a partir de una lista. 
    #@param lista[Lista]
    #@return [Array]
    def ordenarFor lista
        auxList = lista.convertArray lista
        for i in 0..(auxList.length) do
            for j in 0..(auxList.length-2) do 
                if(auxList[j] > auxList[j+1])
                    temporal = auxList[j]
                    auxList[j] = auxList[j+1]
                    auxList[j+1] = temporal 
                end
            end 
        end
        auxList
    end 
    
    #@note Método para ordenar un array creado a partir de una lista. 
    #@param lista[Lista]
    #@return [Array]
    def ordenarEach lista
        auxList = lista.convertArray lista 
        indice = 0
        auxList.each do |x|
            auxList.each do |y|
                if (indice < auxList.length-1)
                    if (auxList[indice] > auxList[indice+1])
                        temporal = auxList[indice]
                        auxList[indice] = auxList[indice+1]
                        auxList[indice+1] = temporal 
                    end
                end
                indice = indice+1
            end
            indice = 0
        end
        auxList
    end
    
    #@note Método para ordenar un array creado a partir de una lista usando el método sort
    #@param lista[Lista]
    #@return [Array]
    def ordenarSort lista
        auxList = lista.convertArray lista 
        auxList.sort
    end 
    
end  

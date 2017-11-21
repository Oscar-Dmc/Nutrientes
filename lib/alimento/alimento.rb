#Clase padre de alimentos.
class Alimentos
    attr_accessor :proteinas, :glucidos, :lipidos, :datos
    include Comparable
    
    #@note Construcctor de la clase alimentos
    #@param Le pasamos los datos necesarios para construir el alimento,  proteinas [Number], glucidos [Number] y lipidos [Number].
    def initialize(proteinasA, glucidosA, lipidosA)
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end
    
    #@note Sobrecargamos el operador distinto para que funcione el Módulo Comparable. Comparación efectuada según el valor energético. 
    #@param Objeto del tipo alimento con el cual se efectuará la comparación. 
    #@return Si los valores de los objetos son iguales, devuelve 0, en caso de que el de este objeto sea menor, devolverá -1 y 1 en otro caso.  
    def <=> otro
        return nil unless otro.is_a?Alimentos #Si el otro objeto no es de tipo Alimentos devuelve nulo.
        if v_energetico == otro.v_energetico
            return 0 
        else
            if v_energetico < otro.v_energetico
                return -1
            else 
                return 1
            end
        end
    end 
    
    #@note Sobrecargamos el operador igual para que funcione el Módulo Comparable. Comparación efectuada según el valor energético.
    #@param Objeto del tipo alimento con el cual se efectuará la comparación. 
    #@return Si ambos objetos son iguales en valor energético, devolverá verdadero, en cualquier otro caso, será falso el valor devuelto. 
    def == otro
        if otro.is_a?Alimentos
            v_energetico == otro.v_energetico
        else
            false
        end
    end
    
    #@note Método para realizar el cálculo del valor energético.  
    #@return Calcula el valor energético de un alimento.
    def v_energetico
        valor = (@proteinas * 4) + (@glucidos * 4) + (@lipidos * 9)
        valor
    end 
    
    #@note Método para la correcta visualización del alimento.  
    #@return Devuelve la salida de un Alimento formateado.
    def to_s
        s = "#{@proteinas}\t#{@glucidos}\t#{@lipidos}"
        s
    end
    
    #@param Se pasa el indice de del individuo al que acceder.
    #@return Devuelve el valor de aibc para ese individuo. 
    def aibc indice
        aux = []
        datos[indice][1..datos[indice].length - 1].zip(datos[indice][0..datos[indice].length - 2]) do |x,y|
            if x < datos[indice][0]
                aux << 0.0
            else
                aux << (((x-datos[indice][0])+(y-datos[indice][0]))/2)*5
            end 
        end
        aux.reduce(:+)
    end 

end 
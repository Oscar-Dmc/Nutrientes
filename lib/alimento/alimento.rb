
#Clase padre de alimentos
class Alimentos
    attr_accessor :proteinas, :glucidos, :lipidos, :datos
    include Comparable
    
    def initialize(proteinasA, glucidosA, lipidosA)
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end
    
    def <=> (otro)
        return nil unless otro.is_a?Alimentos #Si el otro objeto no es de tipo Alimentos devuelve nulo
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
    
    def == (otro)
        if otro.is_a?Alimentos
            v_energetico == otro.v_energetico
        else
            false
        end
    end
    
    def v_energetico
        valor = (@proteinas * 4) + (@glucidos * 4) + (@lipidos * 9)
        valor
    end 
    
    def to_s
        s = "#{@proteinas}\t#{@glucidos}\t#{@lipidos}"
        s
    end
    
    def aibc (indice)
        aux = []
        datos[indice][1..datos[indice].length - 1].zip(datos[indice][0..datos[indice].length - 2]){
            |x,y| aux << (((x-datos[indice][0])+(y-datos[indice][0]))/2)*5
        }
        aux.reduce(:+)
    end 

end 
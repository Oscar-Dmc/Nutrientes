
#Clase padre de alimentos
class Alimentos
    attr_accessor :proteinas, :glucidos, :lipidos
    include Comparable
    
    def initialize(proteinasA, glucidosA, lipidosA)
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end
    
    def <=> (otro)
        return nil unless otro.is_a?Alimentos #Si el otro objeto no es de tipo Alimentos devuelve nulo
        if v_energetico < otro.v_energetico
            return -1
        else 
            return 1
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

end 
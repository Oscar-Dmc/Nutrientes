
#Clase padre de alimentos
class Alimentos
    attr_accessor :proteinas, :glucidos, :lipidos
    
    def initialize(proteinasA, glucidosA, lipidosA)
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end
    
    def to_s
        s = "#{@proteinas}\t#{@glucidos}\t#{@lipidos}"
        s
    end
    
    def v_energetico
        valor = (@proteinas * 4) + (@glucidos * 4) + (@lipidos * 9)
        valor
    end 

end 
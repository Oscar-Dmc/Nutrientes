

class Alimentos
    attr_accessor :nombre, :proteinas, :glucidos, :lipidos
    
    def initialize(nombreA, proteinasA, glucidosA, lipidosA)
        @nombre = nombreA
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end
    
    def to_s
        s = "#{@nombre}\t#{@proteinas}\t#{@glucidos}\t#{@lipidos}"
        return s
    end
    
    def v_energetico
        valor = (@proteinas * 4) + (@glucidos * 4) + (@lipidos * 9)
        return valor
    end 

end 
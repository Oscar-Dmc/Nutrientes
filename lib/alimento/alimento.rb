

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
    end 

end 
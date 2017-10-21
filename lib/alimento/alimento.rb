

class Alimentos
    attr_accessor :nombre, :proteinas, :glucidos, :lipidos
    
    def initialize(nombreA, proteinasA, glucidosA, lipidosA)
        @nombre = nombreA
        @proteinas = proteinasA
        @glucidos = glucidosA
        @lipidos = lipidosA
    end

end 
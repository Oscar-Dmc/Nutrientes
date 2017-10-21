

class Alimentos
    attr_accessor :nombre, :proteinas, :glucidos
    
    def initialize(nombreA, proteinasA, glucidosA)
        @nombre = nombreA
        @proteinas = proteinasA
        @glucidos = glucidosA
    end

end 
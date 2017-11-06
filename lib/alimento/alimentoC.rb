require "alimento.rb"

class AlimentoC < Alimentos
    attr_accessor :nombre, :grupo
    
    def initialize(nombreA, proteinasA, glucidosA, lipidosA, grupoA)
        @nombre = nombreA
        super(proteinasA, glucidosA, lipidosA)
        @grupo = grupoA
    end
    
    def to_s
        s =  "#{@nombre}\t"
        s += super.to_s
        s
    end
end
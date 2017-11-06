require "alimento.rb"

class AlimentoC < Alimentos
    attr_accessor :nombre, :grupo
    
    def initialize(nombreA, proteinasA, glucidosA, lipidosA, grupoA)
        @nombre = nombreA
        super(proteinasA, glucidosA, lipidosA)
        @grupo = grupoA
    end
end
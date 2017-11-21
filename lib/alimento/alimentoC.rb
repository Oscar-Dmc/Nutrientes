#Clase hija de alimentos,  para la inclusión del grupo. 
require "alimento.rb"

class AlimentoC < Alimentos
    attr_accessor :nombre, :grupo
    
    #@note Construcctor de la clase alimentos hija. 
    #@param Recibe los datos de la clase padre más nombre [String] y grupo [String]
    def initialize(nombreA, proteinasA, glucidosA, lipidosA, grupoA)
        @nombre = nombreA
        super(proteinasA, glucidosA, lipidosA)
        @grupo = grupoA
    end
    
    #@note Método para la correcta visualización del alimento con nombre y grupo.  
    #@return Devuelve la salida de un Alimento formateado.
    def to_s
        s =  "#{@nombre}\t"
        s += super.to_s
        s += "\t#{@grupo}"
        s
    end
end
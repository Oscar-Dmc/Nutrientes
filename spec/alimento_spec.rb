require "spec_helper"
require "./lib/alimento/alimento.rb"
require "./lib/alimento/lista.rb"
require "./lib/alimento/alimentoC.rb"

RSpec.describe Alimento do
  it "Tiene una version" do
    expect(Alimento::VERSION).not_to be nil
  end

  before :each do
    @huevoFrito = Alimentos.new(14.1, 0.0, 19.5)
  end
  
  
  it "Existe la cantidad de proteinas en gramos" do 
    expect(@huevoFrito.proteinas).not_to be nil
  end
  
  it "Existe la cantidad de glucidos del alimento en gramos" do
    expect(@huevoFrito.glucidos).not_to be nil
  end
  
  it "Existe la candidad de grasas del alimento en gramos." do
    expect(@huevoFrito.lipidos).not_to be nil 
  end 
  
  
  it "Existe un metodo para obtener la cantidad de proteinas" do 
    expect(@huevoFrito.proteinas).to eq(14.1)
  end 
  
  it "Existe un metodo para obtener la cantidad de glucidos" do 
    expect(@huevoFrito.glucidos).to eq(0.0)
  end
  
  it "Existe un metodo para obtener la cantidad de grasas" do 
    expect(@huevoFrito.lipidos).to eq(19.5)
  end
  
  it "Existe un metodo para obtener el alimento formateado " do
    expect(@huevoFrito).to respond_to(:to_s)
    expect(@huevoFrito.to_s).to eq("14.1\t0.0\t19.5")
  end 
  
  it "Existe un metodo para obtener el valor energetico de un alimento" do 
    expect(@huevoFrito).to respond_to(:v_energetico)
    expect(@huevoFrito.v_energetico).to eq(231.9)
  end 
  
end

RSpec.describe Lista do
  before :each do 
    #Alimentos:
    @huevoFrito = Alimentos.new(14.1, 0.0, 19.5)
    @lecheVaca = Alimentos.new(3.3, 4.8, 3.2)
    @yogurt = Alimentos.new(3.8, 4.9, 3.8)
    @cerdo  = Alimentos.new(21.5, 0.0, 6.3)

    
    #Nodos: 
    @nodoA1 = Nodo.new(@huevoFrito, @nodoA2)
    @nodoA3 = Nodo.new(@yogurt, nil, @nodoA2)
    @nodoA2 = Nodo.new(@lecheVaca, @nodoA3, @nodoA1)
    @nodoA4 = Nodo.new(@cerdo)
    
    #Listas: 
    @lista = Lista.new()
  end 
  
  it "Lista vacia" do 
    expect(@lista.size).to eq(0)
  end 
  
  it "Debe existir un Nodo de la lista con sus datos, su siguiente y su previo" do
    expect(@nodoA2.valor).to eq(@lecheVaca)
    expect(@nodoA2.siguiente).to eq(@nodoA3)
    expect(@nodoA2.anterior).to eq(@nodoA1)
  end 
  
  it "Debe existir una Lista con su cabeza y su cola" do 
    @lista.cabeza = @nodoA1
    @lista.cola = @nodoA3
    
    expect(@lista.cabeza).to eq(@nodoA1)
    expect(@lista.cola).to eq(@nodoA3)
  end 
  
  it "Se puede insertar un elemento por el principio de la Lista" do 
    @lista.insertar_cabeza(@nodoA2)
    expect(@lista.cabeza).to eq(@nodoA2)
    
    @lista.insertar_cabeza(@nodoA3)
    expect(@lista.cabeza).to eq(@nodoA3)
    expect(@lista.size).to eq(2)
  end 
  
  it "Se puede insertar un elemento por la cola" do
    @lista.insertar_cola(@nodoA3)
    expect(@lista.cola).to eq(@nodoA3)
    
    @lista.insertar_cola(@nodoA2)
    expect(@lista.cola).to eq(@nodoA2)
    expect(@lista.size).to eq(2)
  end 
  
  it "Se puede insertar un elemento en la pos x" do 
    @lista.insertar_cabeza(@nodoA2)
    @lista.insertar_cabeza(@nodoA1)
    @lista.insertar_pos(@nodoA3, 2)
  
    expect(@lista.cabeza.siguiente).to eq(@nodoA3)
    expect(@lista.size).to eq(3)
  end 
  
  it "Se pueden insertar varios elementos" do 
    @lista.insertar_cabeza(@nodoA2)
    @lista.insertar_cabeza(@nodoA1)
    @lista.insertar_mul([@nodoA3, @nodoA4], 2)
    
    expect(@lista.cabeza.siguiente).to eq(@nodoA3)
    expect(@lista.cabeza.siguiente.siguiente).to eq(@nodoA4)
    expect(@lista.cola).to eq(@nodoA2)
    expect(@lista.size).to eq(4)
  end 
  
  it "Se extrae el primer elemento" do
    @lista.insertar_cabeza(@nodoA2)
    @lista.insertar_cabeza(@nodoA1)
    @lista.insertar_mul([@nodoA3, @nodoA4], 2)
    
    @lista.extrae_cabeza
    expect(@lista.cabeza).to eq(@nodoA3)
    expect(@lista.size).to eq(3)
  end 
  
  it "Se extrae el ultimo elemento" do 
    @lista.insertar_cabeza(@nodoA2)
    @lista.insertar_cabeza(@nodoA1)
    @lista.insertar_mul([@nodoA3, @nodoA4], 2)
    
    @lista.extrae_cola
    expect(@lista.cola).to eq(@nodoA4)
    expect(@lista.size).to eq(3)
  end
  
  it "Se extrae la posicion x" do 
    @lista.insertar_cabeza(@nodoA2)
    @lista.insertar_cabeza(@nodoA1)
    @lista.insertar_mul([@nodoA3, @nodoA4], 2)
    
    expect(@lista.extrae_pos(3)).to eq(@nodoA4)
    expect(@lista.size).to eq(3)
  end 
  
end

RSpec.describe AlimentoC do 
  before :each do
    @HuevoFrito = AlimentoC.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevos, lacteos y helados" )
  end 
  
  it "Existe la jerarquia Alimentos < AlimentoC " do 
    expect(@HuevoFrito).to be_kind_of(Alimentos)
  end 
  
  it "Se puede accedder al grupo del alimento " do
    expect(@HuevoFrito.grupo).to eq("Huevos, lacteos y helados")
  end 
  
  it "Responde correctamente a metodos de la clase padre" do
    expect(@HuevoFrito).to respond_to(:v_energetico)
    expect(@HuevoFrito.v_energetico).to eq(231.9)
  end 
  
  it "Se puede obtener el alimento formateado " do
    expect(@HuevoFrito).to respond_to(:to_s)
    expect(@HuevoFrito.to_s).to eq("Huevo Frito\t14.1\t0.0\t19.5\tHuevos, lacteos y helados")
  end 
end 

RSpec.describe Lista do
  before :each do 
    @HuevoFrito = AlimentoC.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevos, lacteos y helados" )
    @LecheVaca = AlimentoC.new("Leche vaca", 3.3, 4.8, 3.2, "Huevos, lacteos y helados")
    @Yogurt = AlimentoC.new("Yogurt", 3.8, 4.9, 3.8, "Huevos, lacteos y helados")
    @Cerdo = AlimentoC.new("Cerdo", 21.5, 0.0, 6.3, "Carnes y derivados")
    @Ternera = AlimentoC.new("Ternera", 21.1, 0.0, 3.1, "Carnes y derivados")
    @Pollo = AlimentoC.new("Pollo", 20.6, 0.0, 5.6, "Carnes y derivados")
    @Bacalao = AlimentoC.new("Bacalao",  17.7, 0.0, 0.4, "Pescados y mariscos") 
    @Atun = AlimentoC.new("Atun", 21.5, 0.0, 15.5, "Pescados y mariscos") 
    @Salmon = AlimentoC.new("Salmon",  19.9, 0.0, 13.6, "Pescados y mariscos") 
    @AceiteOliva = AlimentoC.new("Aceite de oliva", 0.0, 0.2, 99.6, "Alimentos grasos") 
    @Mantequilla = AlimentoC.new("Mantequilla", 0.7, 0.0, 83.2, "Alimentos grasos") 
    @Chocolate = AlimentoC.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos grasos") 
    @Azucar = AlimentoC.new("Azucar", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos") 
    @Arroz = AlimentoC.new("Arroz",6.8, 77.7, 0.6, "Alimentos ricos en carbohidratos") 
    @Lentejas = AlimentoC.new("Lentejas",  23.5, 52.0, 1.4, "Alimentos ricos en carbohidratos") 
    @Papas = AlimentoC.new("Papas",2.0, 15.4, 0.1, "Alimentos ricos en carbohidratos") 
    @Tomate = AlimentoC.new("Tomate", 1.0, 3.5, 0.2, "Verduras y Hortalizas") 
    @Cebolla = AlimentoC.new("Cebolla", 1.3, 5.8, 0.3, "Verduras y Hortalizas") 
    @Calabaza = AlimentoC.new("Calabaza", 1.1, 4.8, 0.1, "Verduras y Hortalizas") 
    @Manzanas = AlimentoC.new("Manzanas", 0.3, 12.4, 0.4, "Frutas") 
    @Platanos = AlimentoC.new("Platanos", 1.2, 21.4, 0.2, "Frutas") 
    @Pera = AlimentoC.new("Pera",  0.5, 12.7, 0.3, "Frutas")
    
    @nodo1 = Nodo.new(@HuevoFrito)
    @nodo2 = Nodo.new(@LecheVaca)
    @nodo3 = Nodo.new(@Yogurt)
    @nodo4 = Nodo.new(@Cerdo)
    @nodo5 = Nodo.new(@Ternera)
    @nodo6 = Nodo.new(@Pollo)
    @nodo7 = Nodo.new(@Bacalao)
    @nodo8 = Nodo.new(@Atun)
    @nodo9 = Nodo.new(@Salmon)
    @nodo10 = Nodo.new(@AceiteOliva)
    @nodo11 = Nodo.new(@Mantequilla)
    @nodo13 = Nodo.new(@Chocolate)
    @nodo14 = Nodo.new(@Azucar)
    @nodo15 = Nodo.new(@Arroz)
    @nodo16 = Nodo.new(@Lentejas)
    @nodo17 = Nodo.new(@Papas)
    @nodo18 = Nodo.new(@Tomate)
    @nodo19 = Nodo.new(@Cebolla)
    @nodo20 = Nodo.new(@Calabaza)
    @nodo21 = Nodo.new(@Manzanas)
    @nodo22 = Nodo.new(@Platanos)
    @nodo23 = Nodo.new(@Pera)
    
    @lista = Lista.new()
    @lista.insertar_cola(@nodo1)
    @lista.insertar_cola(@nodo2)
    @lista.insertar_cola(@nodo3)
    @lista.insertar_cola(@nodo4)
    @lista.insertar_cola(@nodo5)
    @lista.insertar_cola(@nodo6)
    @lista.insertar_cola(@nodo7)
    @lista.insertar_cola(@nodo8)
    @lista.insertar_cola(@nodo9)
    @lista.insertar_cola(@nodo10)
    @lista.insertar_cola(@nodo11)
    @lista.insertar_cola(@nodo13)
    @lista.insertar_cola(@nodo14)
    @lista.insertar_cola(@nodo15)
    @lista.insertar_cola(@nodo16)
    @lista.insertar_cola(@nodo17)
    @lista.insertar_cola(@nodo18)
    @lista.insertar_cola(@nodo19)
    @lista.insertar_cola(@nodo20)
    @lista.insertar_cola(@nodo21)
    @lista.insertar_cola(@nodo22)
    @lista.insertar_cola(@nodo23)
  end 
    
    it "Lista reponde a un metodo to_s para mostrar la lista" do
      expect(@lista).to respond_to(:to_s)
      puts @lista.to_s
    end 
    
  describe "Pruebas práctica 10" do
    
    it "Conversion a array " do
      aux = []
      aux = @lista.convertArray(@lista)
      expect(@lista.size).to eq(aux.length)
    end 
    
    it "Ordenación con for" do 
      aux = []
      aux =  @lista.ordenarFor(@lista)
      
      expect(aux[1]).to eq(@HuevoFrito)
      expect(aux[22]).to eq(@Tomate)
    end 

  end 
end


RSpec.describe Alimento do
  before :each do 
    @HuevoFrito = AlimentoC.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevos, lacteos y helados" )
    @LecheVaca = AlimentoC.new("Leche vaca", 3.3, 4.8, 3.2, "Huevos, lacteos y helados")
    @Yogurt = AlimentoC.new("Yogurt", 3.8, 4.9, 3.8, "Huevos, lacteos y helados")
    @Cerdo = AlimentoC.new("Cerdo", 21.5, 0.0, 6.3, "Carnes y derivados")
    @Ternera = AlimentoC.new("Ternera", 21.1, 0.0, 3.1, "Carnes y derivados")
    @Pollo = AlimentoC.new("Pollo", 20.6, 0.0, 5.6, "Carnes y derivados")
    @Bacalao = AlimentoC.new("Bacalao",  17.7, 0.0, 0.4, "Pescados y mariscos")
    @YogurtLimon = AlimentoC.new("Yogurt de Limon", 3.8, 4.9, 3.8, "Huevos, lacteos y helados")
    
    @nodo1 = Nodo.new(@HuevoFrito)
    @nodo2 = Nodo.new(@LecheVaca)
    @nodo3 = Nodo.new(@Yogurt)
    @nodo4 = Nodo.new(@Cerdo)
    @nodo5 = Nodo.new(@Ternera)
    @nodo6 = Nodo.new(@Pollo)
    @nodo7 = Nodo.new(@Bacalao)
    @nodo8 = Nodo.new(@YogurtLimon)
    
    @lista = Lista.new()
    @lista.insertar_cola(@nodo1)
    @lista.insertar_cola(@nodo2)
    @lista.insertar_cola(@nodo3)
    @lista.insertar_cola(@nodo4)
    @lista.insertar_cola(@nodo5)
    @lista.insertar_cola(@nodo6)
    @lista.insertar_cola(@nodo7)
    @lista.insertar_cola(@nodo8)
  end

  it "El Huevo Frito tiene mas valor energetico que la Leche de Vaca" do
    expect(@HuevoFrito > @LecheVaca).to eq(true)
  end 
  
  it "El Pollo tiene menos valor energetico que el Cerdo" do 
    expect(@Pollo < @Cerdo).to eq(true)
  end
  
  it "El Yogurt y el Yogurt de limon son iguales en terminos de valores" do 
    expect(@Yogurt == @YogurtLimon).to eq(true)
  end
  
  it "Pruebas para utilizar el Mixin Enumerable - Funcion maximo en la clase lista" do
    expect(@lista.max).to eq(@HuevoFrito)
  end 
  
  it "Pruebas para utilizar el Mixin Enumerable - Funcion minima en la clase lista" do 
    expect(@lista.min).to eq (@LecheVaca)
  end 
  
  it "Funcion include" do
    expect(@lista.include?@HuevoFrito).to eq(true)
    expect(@lista.include?@LecheVaca).to eq(true)
    expect(@lista.include?@Pollo).to eq(true)
  end 
  
  it "Funcion count" do 
    expect(@lista.count).to eq(8) 
  end
  
end 

RSpec.describe Alimento do
  before :each do
    @CompManzana = AlimentoC.new("Compota de manzana", 4.1, 0.0, 9.5, "Frutas y derivados" )
    @Yogurt = AlimentoC.new("Yogurt", 3.8, 4.9, 3.8, "Huevos, lacteos y helados")
    @Chocolate = AlimentoC.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos grasos") 
    
    @Azucar = AlimentoC.new("Azucar", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos")
    
    #Iniciamos el array de datos
    @CompManzana.datos = [[6.7,6.5,6.8,6.9,7.0,7.1,6.9,6.9,6.9,6.7,6.9,7.3,7.0,7.0,7.2,7.1,6.8,7.2,7.3,7.0,6.8,6.7,6.8,6.7,6.9],
                          [4.6,4.8,5.3,5.6,6.1,6.5,6.6,7.0,7.0,6.8,6.4,6.3,6.1,6.1,6.2,6.0,6.1,6.1,6.2,6.3,6.4,6.1,6.1,5.7,5.9]]
    @Azucar.datos = [[4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9,6.8,6.3,6.2,6.3,6.2,6.3,6.1],
                     [6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5]]
    @Yogurt.datos = [[6.1,6.6,6.3,6.3,6.1,6.9,6.8,6.5,6.4,6.9,6.8,6.5,6.3,6.2,6.7,6.2,5.9,5.8,5.8,5.8,5.8,5.8,5.9,6.2,6.4],
                     [4.9,4.9,5.2,5.8,6.5,7.0,7.2,7.3,7.3,6.6,6.2,6.1,6.0,6.1,5.9,5.9,5.9,5.9,5.8,5.8,5.5,5.5,5.6,5.9,5.9]]
    @Chocolate.datos = [[6.5,6.5,6.7,6.5,6.5,6.8,6.7,6.2,6.5,7.2,6.9,7.0,6.3,6.2,6.1,5.9,5.8,6.1,6.7,6.7,6.6,6.7,6.9,7.2,7.1],
                        [4.6,4.6,4.7,4.7,4.8,4.7,4.8,4.8,4.6,4.4,4.7,4.7,4.8,4.7,5.2,5.9,5.9,5.7,5.4,5.3,5.1,4.8,4.8,4.9,5.9]]
    

  end
  
  it "Se pueden pasar los datos de los individuos." do
    expect(@CompManzana.datos.size).to eq(2)
  end 
  
  it "Se dispone de un metodo para calcular AIBC de un alimento" do 
    expect(@CompManzana.aibc(0)).to eq(27.999999999999993)
    expect(@Yogurt.aibc(0)).to eq(30.500000000000036)
    expect(@Chocolate.aibc(0)).to eq(18.500000000000007)
    expect(@Azucar.aibc(0)).to eq(255.99999999999997)
  end 
  
  it "Calculo de indice glucemico por individuo " do
    expect((@CompManzana.aibc(0) / @Azucar.aibc(0)) * 100).to  eq(10.937499999999998)
    expect((@CompManzana.aibc(1) / @Azucar.aibc(1)) * 100).to  eq(93.49489795918366)
    expect((@Yogurt.aibc(0) / @Azucar.aibc(0)) * 100).to  eq(11.914062500000016)
    expect((@Yogurt.aibc(1) / @Azucar.aibc(1)) * 100).to  eq(70.66326530612243)
    expect((@Chocolate.aibc(0) / @Azucar.aibc(0)) * 100).to  eq(7.226562500000004)
    expect((@Chocolate.aibc(1) / @Azucar.aibc(1)) * 100).to  eq(22.83163265306124)
  end 
  
  it "Calculo de indice glucemico del alimento" do
    aux = (0..@CompManzana.datos.length - 1).map { |x| (@CompManzana.aibc(x) / @Azucar.aibc(x)) * 100}
    igCompManz = aux.reduce(:+)/@CompManzana.datos.length - 1
    aux = (0..@Yogurt.datos.length - 1).map { |x| (@Yogurt.aibc(x) / @Azucar.aibc(x)) * 100}
    igYogurt = aux.reduce(:+)/@Yogurt.datos.length - 1
    aux = (0..@Chocolate.datos.length - 1).map { |x| (@Chocolate.aibc(x) / @Azucar.aibc(x)) * 100}
    igChocolate = aux.reduce(:+)/@Yogurt.datos.length - 1
    
    expect(igCompManz).to eq(51.21619897959183)
    expect(igYogurt).to eq(40.28866390306122)
    expect(igChocolate).to eq(14.029097576530623)
  end 
  
end 

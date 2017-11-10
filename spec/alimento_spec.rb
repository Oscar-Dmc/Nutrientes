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
  
  end

  it "El Huevo Frito tiene mas lipidos que la Leche de Vaca" do
    expect(@HuevoFrito > @LecheVaca).to eq(true)
  end 
  
  it "El Pollo tiene menos lipidos que el Cerdo" do 
    expect(@Pollo < @Cerdo).to eq(true)
  end
end 


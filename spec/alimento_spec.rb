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
  
  #it "Existe un nombre para el alimento" do
    #expect(@huevoFrito.nombre).not_to be nil
  #end
  
  it "Existe la cantidad de proteinas en gramos" do 
    expect(@huevoFrito.proteinas).not_to be nil
  end
  
  it "Existe la cantidad de glucidos del alimento en gramos" do
    expect(@huevoFrito.glucidos).not_to be nil
  end
  
  it "Existe la candidad de grasas del alimento en gramos." do
    expect(@huevoFrito.lipidos).not_to be nil 
  end 
  
  #it "Existe un metodo para obtener el nombre " do 
  #  expect(@huevoFrito.nombre).to eq("Huevo Frito")
  #end
  
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
  
  it "Responde correctamente a metodos de la clase padre" do
    expect(@HuevoFrito).to respond_to(:v_energetico)
    expect(@HuevoFrito.v_energetico).to eq(231.9)
  end 
  
  it "Se puede obtener el alimento formateado " do
    expect(@HuevoFrito).to respond_to(:to_s)
    expect(@HuevoFrito.to_s).to eq("Huevo Frito\t14.1\t0.0\t19.5")
  end 
end 


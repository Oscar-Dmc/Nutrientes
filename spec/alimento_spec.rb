require "spec_helper"
require "./lib/alimento/alimento.rb"
require "./lib/alimento/lista.rb"

RSpec.describe Alimento do
  it "Tiene una version" do
    expect(Alimento::VERSION).not_to be nil
  end

  before :each do
    @huevoFrito = Alimentos.new("Huevo Frito", 14.1, 0.0, 19.5)
  end
  
  it "Existe un nombre para el alimento" do
    expect(@huevoFrito.nombre).not_to be nil
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
  
  it "Existe un metodo para obtener el nombre " do 
    expect(@huevoFrito.nombre).to eq("Huevo Frito")
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
    expect(@huevoFrito.to_s).to eq("Huevo Frito\t14.1\t0.0\t19.5")
  end 
  
  it "Existe un metodo para obtener el valor energetico de un alimento" do 
    expect(@huevoFrito).to respond_to(:v_energetico)
    expect(@huevoFrito.v_energetico).to eq(231.9)
  end 
  
end

RSpec.describe Lista do
  before :each do 
    #Alimentos:
    @huevoFrito = Alimentos.new("Huevo Frito", 14.1, 0.0, 19.5)
    @lecheVaca = Alimentos.new("Leche vaca", 3.3, 4.8, 3.2)
    @Yogurt = Alimentos.new("Yogurt", 3.8, 4.9, 3.8)
    
    #Nodos: 
    @nodo1 = Nodo.new(@lecheVaca, @yogurt, @huevoFrito)
    
    #Listas: 
    @lista = Lista.new()
  end 
  
  it "Lista vacia" do 
    expect(@lista.size).to eq(0)
  end 
  
  it "Debe existir un Nodo de la lista con sus datos, su siguiente y su previo" do
    expect(@nodo1.valor).to eq(@lecheVaca)
    expect(@nodo1.siguiente).to eq(@yogurt)
    expect(@nodo1.anterior).to eq(@huevoFrito)
  end 
  
end


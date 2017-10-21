require "spec_helper"
require "./lib/alimento/alimento.rb"

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
  
end

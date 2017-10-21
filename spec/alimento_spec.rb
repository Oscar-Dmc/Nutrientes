require "spec_helper"
require "./lib/alimento/alimento.rb"

RSpec.describe Alimento do
  it "Tiene una version" do
    expect(Alimento::VERSION).not_to be nil
  end

  before :each do
    @huevoFrito = Alimentos.new("Huevo Frito", 14.1)
  end
  
  it "Existe un nombre para el alimento" do
    expect(@huevoFrito.nombre).not_to be nil
    expect(@huevoFrito.nombre).to eq("Huevo Frito")
  end
  
  it "Existe la cantidad de proteinas en gramos" do 
    expect(@huevoFrito.proteinas).not_to be nil
    expect(@huevoFrito.proteinas).to eq(14.1)
  end 
end

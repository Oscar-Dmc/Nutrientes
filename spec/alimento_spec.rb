require "spec_helper"

RSpec.describe Alimento do
  it "Tiene una version" do
    expect(Alimento::VERSION).not_to be nil
  end

  before :each do
    @huevoFrito = Alimento.new("Huevo Frito")
  end
  
  it "Existe un nombre para el alimento" do
    expect(@huevoFrito.nombre).not_to be nil
  end
end

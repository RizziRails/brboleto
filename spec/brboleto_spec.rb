# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Brboleto" do
  it "Validar opções padrão" do
    Brboleto.configuration.gerador.should eql(:rghost)
    Brboleto.configuration.formato.should eql(:pdf)
  end

  it "Mudar configurações" do
    Brboleto.setup do |config|
      config.gerador = :prawn
      config.formato = :gif
    end
    Brboleto.configuration.gerador.should eql(:prawn)
    Brboleto.configuration.formato.should eql(:gif)
  end
end
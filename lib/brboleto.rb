require 'brboleto/calculo'
require 'brboleto/limpeza'
require 'brboleto/formatacao'
require 'brboleto/calculo_data'
require 'brboleto/currency'

begin
  require 'date'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'date'
  require 'date'
end

begin
  require 'active_model'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'active_model', '>= 3.0.0'
  require 'active_model'
end

module Brboleto
  # Exception lançada quando algum tipo de boleto
  # soicitado ainda não tiver sido implementado.
  class NaoImplementado < NotImplementedError
  end

  # Exception lançada quando os dados informados para o boleto estão inválidos.
  #
  # Você pode usar assim na sua aplicação:
  #   rescue Brboleto::BoletoInvalido => invalido
  #   puts invalido.errors
  class BoletoInvalido < StandardError
    # Atribui o objeto boleto e pega seus erros de validação
    def initialize(boleto)
      errors = boleto.errors.full_messages.join(', ')
      super(errors)
    end
  end

  # Configurações do Brboleto.
  #
  # Para mudar as configurações padrão, você pode fazer assim:
  # config/environments/test.rb:
  #
  #     Brboleto.setup do |config|
  #       config.formato = :gif
  #     end
  #
  # Ou colocar em um arquivo na pasta initializer do rails.
  class Configuration
    # Gerador de arquivo de boleto.
    # @return [Symbol]
    # @param  [Symbol] (Padrão: :rghost)
    attr_accessor :gerador
    # Formato do arquivo de boleto a ser gerado.
    # @return [Symbol]
    # @param  [Symbol] (Padrão: :pdf)
    # @see Veja mais formatos na documentação do rghost http://bit.ly/1hOCcnO
    attr_accessor :formato

    # Resolução em pixels do arquivo gerado.
    # @return [Integer]
    # @param  [Integer] (Padrão: 150)
    attr_accessor :resolucao

    # Ajusta o encoding do PDF
    # @return [String]
    # @param  [String] (Padrão: ascii-8bit)
    attr_accessor :external_encoding

    # Atribui valores padrões de configuração
    def initialize
      self.gerador = :rghost
      self.formato = :pdf
      self.resolucao = 150
      self.external_encoding = 'ascii-8bit'
    end
  end

  # Atribui os valores customizados para as configurações.
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Bloco para realizar configurações customizadas.
  def self.setup
    yield(configuration)
  end

  # Módulo para classes de boletos
  module Boleto
    autoload :Base,          'brboleto/boleto/base'
    autoload :BancoBrasil,   'brboleto/boleto/banco_brasil'
    autoload :Itau,          'brboleto/boleto/itau'
    autoload :Hsbc,          'brboleto/boleto/hsbc'
    autoload :Bradesco,      'brboleto/boleto/bradesco'
    autoload :Caixa,         'brboleto/boleto/caixa'
    autoload :Sicredi,       'brboleto/boleto/sicredi'
    autoload :Santander,     'brboleto/boleto/santander'

    # Módulos para classes de template
    module Template
      autoload :Base,   'brboleto/boleto/template/base'
      autoload :Rghost, 'brboleto/boleto/template/rghost'
    end
  end
end

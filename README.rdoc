= brboleto

Gem para emissão de boletos bancários em Ruby on Rails 3.x e 4.x

== COMPATIBILIDADE

* Rails 3.x e 4.x
* Ruby 2.0, 2.1.0 e 2.1.1
* Esta gem não é compatível com Ruby 1.9.3

== Bancos Disponíveis

* Banco do Brasil
  * TODAS AS CARTEIRAS PRESENTES NA DOCUMENTAÇÃO

* Banco Itaú
  * TODAS AS CARTEIRAS PRESENTES NA DOCUMENTAÇÃO

* Banco HSBC
  * CNR

* Banco Bradesco
  * TODAS AS CARTEIRAS PRESENTES NA DOCUMENTAÇÃO

* Banco Caixa
  * Sem registro (SR) by Túlio Ornelas - https://github.com/tulios

* Banco SICREDI

* Banco Santander by Ronaldo Araujo - https://github.com/ronaldoaraujo
  * Sem registro
  * Com registro

== Retornos Disponíveis

* CBR643
* CNAB240

== REQUISITOS

* rghost >= 0.9.4
* rghost_barcode >= 0.9
* parseline >= 1.0.3
* GhostScript > 8.0

== INSTALAÇÃO

Acrescente no seu Gemfile

    gem 'brboleto'

depois rode o comando

    bundle

Essa gem requer que o programa GhostScipt esteja rodando no seu sistema . Para instalar o GhostScript:

Ubuntu / Debian

    aptitude install ghostscript

No Mac OS X, instala através do Homebrew 

    brew install ghostscript

== LICENÇA

Licença BSD

Baseado na gem brcobranca de Kivanio Barbosa

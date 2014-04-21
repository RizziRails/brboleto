module Brboleto
  module Boleto
    module Template
      module Base
        extend self

        def define_template(template)

          return Brboleto::Boleto::Template::Rghost

        end
      end
    end
  end
end

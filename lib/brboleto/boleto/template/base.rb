module Brboleto
  module Boleto
    module Template
      module Base
        extend self

        def define_template(template)

          case template
          when :rghost
            return Brboleto::Boleto::Template::Rghost
          when :rghost_carne
            return Brboleto::Boleto::Template::RghostCarne
          else
            return Brboleto::Boleto::Template::Rghost
          end

        end
      end
    end
  end
end

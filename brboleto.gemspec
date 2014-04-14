$:.push File.expand_path("../lib", __FILE__)
require "brboleto/version"

Gem::Specification.new do |s|
  s.name        = "brboleto"
  s.version     = Brboleto::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors = ["Guilherme Albuk baseado no trabalho de Kivanio Barbosa"]
  s.date = %q{2014-03-27}
  s.description = %q{Gem para emissão de boletos bancários em PDF}
  s.summary = %q{Compatível com Ruby on Rails 3.x e 4.x e Ruby 2.0 ou superior}
  s.email = %q{guialbuk@gmail.com}
  s.homepage = %q{https://github.com/guialbuk/brboleto}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.requirements = ["GhostScript > 8.0, para gear PDF e código de Barras"]

  s.add_runtime_dependency(%q<rghost>, ["~> 0.9", ">= 0.9.4"])
  s.add_runtime_dependency(%q<rghost_barcode>, ["~> 0.9"])
  s.add_runtime_dependency(%q<parseline>, ["~> 1.0", ">= 1.0.3"])
  s.add_runtime_dependency(%q<activemodel>, [">= 3"])

end

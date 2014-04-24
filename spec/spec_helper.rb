$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'tempfile'
require 'bundler/setup'
require 'brboleto'
require 'rghost'

require 'coveralls'
Coveralls.wear!

RGhost::Config::GS[:path] = '/usr/local/bin/gs'
I18n.enforce_available_locales = false

RSpec.configure do |config|
end

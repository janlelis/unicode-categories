# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/unicode/categories/constants"

Gem::Specification.new do |gem|
  gem.name          = "unicode-categories"
  gem.version       = Unicode::Categories::VERSION
  gem.summary       = "Determine the Unicode General Categories of a string"
  gem.description   = "[Unicode #{Unicode::Categories::UNICODE_VERSION}] Determine which Unicode \"General Categories\" a string belongs to"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/unicode-categories"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.0"
end

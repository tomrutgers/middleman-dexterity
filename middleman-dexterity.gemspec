# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-dexterity"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Guillot"]
  s.email       = ["chris@techfo.xyz"]
  # s.homepage    = "http://example.com"
  s.summary     = %q{Middleman extension for generating thumbnails}
  s.description = %q{just doing this since there's none that work for mm v4}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.1.8"])
  s.add_runtime_dependency('mini_magick', ['~> 4.5'])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end

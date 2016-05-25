# -*- encoding: utf-8 -*-
# stub: middleman-dexterity 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-dexterity".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Guillot".freeze]
  s.date = "2016-05-25"
  s.description = "just doing this since there's none that work for mm v4".freeze
  s.email = ["chris@techfo.xyz".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "Rakefile".freeze, "features/support/env.rb".freeze, "lib/middleman-dexterity.rb".freeze, "lib/middleman-dexterity/extension.rb".freeze, "middleman-dexterity.gemspec".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Middleman extension for generating thumbnails".freeze
  s.test_files = ["features/support/env.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<middleman-core>.freeze, [">= 4.1.8"])
      s.add_runtime_dependency(%q<mini_magick>.freeze, ["~> 4.5"])
    else
      s.add_dependency(%q<middleman-core>.freeze, [">= 4.1.8"])
      s.add_dependency(%q<mini_magick>.freeze, ["~> 4.5"])
    end
  else
    s.add_dependency(%q<middleman-core>.freeze, [">= 4.1.8"])
    s.add_dependency(%q<mini_magick>.freeze, ["~> 4.5"])
  end
end

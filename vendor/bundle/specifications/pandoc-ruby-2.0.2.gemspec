# -*- encoding: utf-8 -*-
# stub: pandoc-ruby 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pandoc-ruby".freeze
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["William Melody".freeze]
  s.date = "2017-09-17"
  s.description = "Ruby wrapper for Pandoc".freeze
  s.email = "hi@williammelody.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "http://github.com/alphabetum/pandoc-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.7.3".freeze
  s.summary = "PandocRuby".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>.freeze, [">= 1.1.0", "~> 1.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 4.2.0", "~> 4.2"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 5.8.3", "~> 5.8.3"])
    else
      s.add_dependency(%q<mocha>.freeze, [">= 1.1.0", "~> 1.1"])
      s.add_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
      s.add_dependency(%q<rdoc>.freeze, [">= 4.2.0", "~> 4.2"])
      s.add_dependency(%q<minitest>.freeze, [">= 5.8.3", "~> 5.8.3"])
    end
  else
    s.add_dependency(%q<mocha>.freeze, [">= 1.1.0", "~> 1.1"])
    s.add_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
    s.add_dependency(%q<rdoc>.freeze, [">= 4.2.0", "~> 4.2"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.8.3", "~> 5.8.3"])
  end
end

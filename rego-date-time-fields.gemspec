# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rego-date-time-fields"
  s.version = "0.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex"]
  s.date = "2015-06-12"
  s.description = "Support for timestamp date and time fields to ActiveRecord and forms"
  s.email = "tkachev.alex@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rego-date-time-fields.rb",
    "lib/rego-date-time-fields/action_view.rb",
    "lib/rego-date-time-fields/active_record.rb",
    "lib/rego-date-time-fields/railtie.rb",
    "lib/rego-date-time-fields/type_caster.rb",
    "rego-date-time-fields.gemspec"
  ]
  s.homepage = "http://github.com/alextk/rego-date-time-fields"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.15"
  s.summary = "Support for timestamp date and time fields to ActiveRecord and forms"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.0.9"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.8"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 2.7.0"])
    else
      s.add_dependency(%q<rails>, ["= 3.0.9"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.8"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.7.0"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.0.9"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.8"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.7.0"])
  end
end


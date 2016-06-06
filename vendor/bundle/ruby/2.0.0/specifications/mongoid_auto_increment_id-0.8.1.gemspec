# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongoid_auto_increment_id"
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Lee"]
  s.date = "2015-11-03"
  s.description = "This gem for change Mongoid id field as Integer like MySQL."
  s.email = ["huacnlee@gmail.com"]
  s.homepage = "https://github.com/huacnlee/mongoid_auto_increment_id"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Override id field with MySQL like auto increment for Mongoid"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["< 6.0.0", ">= 5.0.0"])
    else
      s.add_dependency(%q<mongoid>, ["< 6.0.0", ">= 5.0.0"])
    end
  else
    s.add_dependency(%q<mongoid>, ["< 6.0.0", ">= 5.0.0"])
  end
end

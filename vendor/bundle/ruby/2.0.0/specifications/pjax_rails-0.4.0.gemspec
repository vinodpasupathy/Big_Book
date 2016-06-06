# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pjax_rails"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson (PJAX by Chris Wanstrath)"]
  s.date = "2013-12-12"
  s.email = "david@loudthinking.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "PJAX integration for Rails 3.1+"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["< 5.0", ">= 3.2"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<poltergeist>, [">= 0"])
    else
      s.add_dependency(%q<railties>, ["< 5.0", ">= 3.2"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<poltergeist>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, ["< 5.0", ">= 3.2"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<poltergeist>, [">= 0"])
  end
end

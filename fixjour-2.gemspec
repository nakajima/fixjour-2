# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fixjour-2}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2011-01-27}
  s.email = %q{patnakajima@gmail.com}
  s.files = ["Gemfile", "Gemfile.lock", "README", "lib/fixjour.rb", "lib/fixjour/builder.rb", "lib/fixjour/dsl.rb", "spec/fixjour_spec.rb", "spec/spec_helper.rb"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.1}
  s.summary = %q{Fixjour Again}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

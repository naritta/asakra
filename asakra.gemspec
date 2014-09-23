# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "asakra/version"

Gem::Specification.new do |s|
  s.name        = "asakra"
  s.version     = Asakra::VERSION
  s.authors     = ["RittaNarita"]
  s.email       = ["narittan@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{monitoring tool for fluentd itself with Esper and JRuby}
  s.description = %q{monitoring tool for fluentd itself with Esper EPL qeury language,}
  s.license       = "GPLv2"
  s.platform      = "java"

  s.rubyforge_project = "asakra"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "esper"]

  s.add_development_dependency "bundler", "~> 1.3"
end

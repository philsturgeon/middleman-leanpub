# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-leanpub"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Phil Sturgeon"]
  # s.email       = ["email@example.com"]
  # s.homepage    = "http://example.com"
  s.summary     = %q{Grab data for LeanPub Books}
  s.description = %q{Use the LeanPub API to download data for a book, then store it in
  data files for access in your templates}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.3.10"])
  
  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end

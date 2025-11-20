# -*- encoding: utf-8 -*-
# stub: minitest 6.0.0.a1 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest"
  s.version = "6.0.0.a1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/minitest/minitest/issues", "changelog_uri" => "https://github.com/minitest/minitest/blob/master/History.rdoc", "homepage_uri" => "https://github.com/minitest/minitest" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Ryan Davis"]
  s.cert_chain = ["/Users/ryan/.gem/gem-public_cert.pem"]
  s.date = "1980-01-02"
  s.description = "minitest provides a complete suite of testing facilities supporting\nTDD, BDD, and benchmarking.\n\n    \"I had a class with Jim Weirich on testing last week and we were\n     allowed to choose our testing frameworks. Kirk Haines and I were\n     paired up and we cracked open the code for a few test\n     frameworks...\n\n     I MUST say that minitest is *very* readable / understandable\n     compared to the 'other two' options we looked at. Nicely done and\n     thank you for helping us keep our mental sanity.\"\n\n    -- Wayne E. Seguin\n\nminitest/test is a small and incredibly fast unit testing framework.\nIt provides a rich set of assertions to make your tests clean and\nreadable.\n\nminitest/spec is a functionally complete spec engine. It hooks onto\nminitest/test and seamlessly bridges test assertions over to spec\nexpectations.\n\nminitest/benchmark is an awesome way to assert the performance of your\nalgorithms in a repeatable manner. Now you can assert that your newb\nco-worker doesn't replace your linear algorithm with an exponential\none!\n\nminitest/pride shows pride in testing and adds coloring to your test\noutput. I guess it is an example of how to write IO pipes too. :P\n\nminitest/test is meant to have a clean implementation for language\nimplementors that need a minimal set of methods to bootstrap a working\ntest suite. For example, there is no magic involved for test-case\ndiscovery.\n\n    \"Again, I can't praise enough the idea of a testing/specing\n     framework that I can actually read in full in one sitting!\"\n\n    -- Piotr Szotkowski\n\nComparing to rspec:\n\n    rspec is a testing DSL. minitest is ruby.\n\n    -- Adam Hawkins, \"Bow Before MiniTest\"\n\nminitest doesn't reinvent anything that ruby already provides, like:\nclasses, modules, inheritance, methods. This means you only have to\nlearn ruby to use minitest and all of your regular OO practices like\nextract-method refactorings still apply."
  s.email = ["ryand-ruby@zenspider.com"]
  s.executables = ["minitest"]
  s.extra_rdoc_files = ["History.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = ["History.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "bin/minitest", "design_rationale.rb", "lib/hoe/minitest.rb", "lib/minitest.rb", "lib/minitest/assertions.rb", "lib/minitest/autorun.rb", "lib/minitest/benchmark.rb", "lib/minitest/complete.rb", "lib/minitest/compress.rb", "lib/minitest/error_on_warning.rb", "lib/minitest/expectations.rb", "lib/minitest/hell.rb", "lib/minitest/manual_plugins.rb", "lib/minitest/parallel.rb", "lib/minitest/pride.rb", "lib/minitest/pride_plugin.rb", "lib/minitest/spec.rb", "lib/minitest/sprint.rb", "lib/minitest/sprint_plugin.rb", "lib/minitest/test.rb", "lib/minitest/test_task.rb", "test/minitest/metametameta.rb", "test/minitest/test_minitest_assertions.rb", "test/minitest/test_minitest_benchmark.rb", "test/minitest/test_minitest_reporter.rb", "test/minitest/test_minitest_spec.rb", "test/minitest/test_minitest_test.rb", "test/minitest/test_minitest_test_task.rb"]
  s.homepage = "https://github.com/minitest/minitest"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 3.2")
  s.rubygems_version = "3.7.2"
  s.summary = "minitest provides a complete suite of testing facilities supporting TDD, BDD, and benchmarking"

  s.specification_version = 4

  # s.add_runtime_dependency(%q<path_expander>, ["~> 1.0"])
  s.add_development_dependency(%q<rdoc>, [">= 4.0", "< 7"])
  s.add_development_dependency(%q<hoe>, ["~> 4.3"])
end

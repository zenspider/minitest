# -*- ruby -*-

require "rubygems"
require "hoe"
$:.unshift "lib" # to pick up lib/minitest/test_task.rb when minitest not installed

Hoe.plugin :seattlerb
Hoe.plugin :rdoc

Hoe.add_include_dirs "../../path_expander/dev/lib"

Hoe.spec "minitest" do
  developer "Ryan Davis", "ryand-ruby@zenspider.com"

  license "MIT"

  require_ruby_version [">= 2.6", "< 4.0"]

  dependency "path_expander", "~> 1.0"

  ## TODO: uncomment this on the last point release on 5.x
  #
  #   self.post_install_message = <<-"EOM"
  # NOTE: minitest 5 will be the last in the minitest family to support
  #       ruby 1.8 and 1.9 (and maybe 2.0?). If you need to keep using 1.8
  #       or 1.9, you need to pin your dependency to minitest with
  #       something like "~> 5.0".
  #
  #       Further, minitest 6 will be dropping the following:
  #
  #       + MiniTest (it's been Minitest for *years*)
  #       + MiniTest::Unit
  #       + MiniTest::Unit::TestCase
  #       + assert_send (unless you argue for it well)
  #   EOM
end

desc "Find missing expectations"
task :specs do
  $:.unshift "lib"
  require "minitest/test"
  require "minitest/spec"

  pos_prefix, neg_prefix = "must", "wont"
  skip_re = /^(must|wont)$|wont_(throw)|must_(block|not?_|nothing|send|raise$)/x
  dont_flip_re = /(must|wont)_(include|respond_to)/

  map = {
    /(must_throw)s/                        => '\1',
    /(?!not)_same/                         => "_be_same_as",
    /_in_/                                 => "_be_within_",
    /_operator/                            => "_be",
    /_includes/                            => "_include",
    /(must|wont)_(.*_of|nil|silent|empty)/ => '\1_be_\2',
    /must_raises/                          => "must_raise",
    /(must|wont)_pattern/                  => '\1_pattern_match',
    /(must|wont)_predicate/                => '\1_be',
    /(must|wont)_path_exists/              => 'path_\1_exist',
  }

  expectations = Minitest::Expectations.public_instance_methods.map(&:to_s)
  assertions   = Minitest::Assertions.public_instance_methods.map(&:to_s)

  assertions.sort.each do |assertion|
    expectation = case assertion
                  when /^assert/ then
                    assertion.sub(/^assert/, pos_prefix.to_s)
                  when /^refute/ then
                    assertion.sub(/^refute/, neg_prefix.to_s)
                  end

    next unless expectation
    next if expectation =~ skip_re

    regexp, replacement = map.find { |re, _| expectation =~ re }
    expectation.sub! regexp, replacement if replacement

    next if expectations.include? expectation

    args = [assertion, expectation].map(&:to_sym).map(&:inspect)
    args << :reverse if expectation =~ dont_flip_re

    puts
    puts "##"
    puts "# :method: #{expectation}"
    puts "# See Minitest::Assertions##{assertion}"
    puts
    puts "infect_an_assertion #{args.join ", "}"
  end
end

task :bugs do
  sh "for f in bug*.rb ; do echo $f; echo; #{Gem.ruby} -Ilib $f && rm $f ; done"
end

Minitest::TestTask.create :testW0 do |t|
  t.warning = false
  t.test_prelude = "$-w = nil"
end

# vim: syntax=Ruby

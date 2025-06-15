#!/usr/bin/env -S ruby

# :stopdoc:

# see instructions in the readme for use

require "optparse"
require "shellwords"
require "prism"

# eg COMP_LINE="blah -n test_autorun test/minitest/test_minitest_test.rb"
argv = Shellwords.split(ENV["COMP_LINE"]).drop 1
comp_re = nil
options = {}

begin
  OptionParser.new do |opts|
    opts.on("-n", "--name [METHOD]", "Test method") do |m|
      comp_re = Regexp.new m
    end
  end.parse!(argv)
rescue
  retry # ignore options passed to Ruby
end

path = argv.find { |f| File.file?(f) && !File.directory?(f) }

exit unless comp_re && path

names, queue = [], [Prism.parse_file(path).value]

while node = queue.shift do
  if node.type == :def_node then
    name = node.name
    names << name if name =~ comp_re
  else
    queue.concat node.compact_child_nodes # no need to process def body
  end
end

puts names.sort

# :startdoc:

require "path_expander"
require "minitest"

##
# Command line runner class for minitest.

class Minitest::Sprint

  require "minitest/autorun"
  require "minitest/path_expander"

  $LOAD_PATH.unshift "test"
  $LOAD_PATH.unshift "lib"

  def self.run args = ARGV
    Minitest::Sprint::PathExpander.new(args).process.each do |f|
      require "./#{f}"
    end
  end

  ##
  # Minitest's PathExpander to find and filter tests.

  class PathExpander < ::PathExpander
    TEST_GLOB = "{test,spec}/{test_*,*_test,spec_*,*_spec}.rb" # :nodoc:

    def initialize args = ARGV # :nodoc:
      args << "test" if args.empty?
      super args, TEST_GLOB
    end

    ##
    # Overrides PathExpander#process_flags to filter out ruby flags
    # from minitest flags. Only supports -I<paths>, -d, and -w for
    # ruby.

    def process_flags flags
      flags.reject { |flag| # all hits are truthy, so this works out well
        case flag
        when /^-I(.*)/ then
          $LOAD_PATH.concat $1.split(/:/)
        when /^-d/ then
          $DEBUG = true
        when /^-w/ then
          $VERBOSE = true
        else
          false
        end
      }
    end
  end

  class SprintReporter < Minitest::AbstractReporter # :nodoc:
    attr_accessor :results # :nodoc:

    def initialize # :nodoc:
      self.results = []
    end

    def record result
      results << result unless result.passed? or result.skipped?
    end

    def report
      return if results.empty?

      puts
      puts "Happy Happy Sprint List:"
      puts
      print_list
      puts
    end
  end

  class BinstubReporter < SprintReporter # :nodoc:
    def print_list # :nodoc:
      results.each do |result|
        puts "  minitest -i #{result.class}##{result.name}"
      end
    end
  end

  class RakeReporter < SprintReporter # :nodoc:
    def print_list # :nodoc:
      results.each do |result|
        puts "  rake N=#{result.class}##{result.name}"
      end
    end
  end
end

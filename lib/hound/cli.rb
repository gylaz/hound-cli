require "hound"

module Hound
  class Cli
    def self.run(arguments)
      new(arguments).run
    end

    def initialize(arguments)
      @arguments = arguments
    end

    def run
      if arguments.empty?
        puts usage
      elsif arguments.first == "config"
        puts Hound.config
      end
    end

    private

    attr_reader :arguments

    def usage
      <<-USAGE
Usage: hound COMMAND

Commands:

  config              # print configuration summary
  config:ruby         # print Ruby configuration
  config:javascript   # print Javascript configuration
      USAGE
    end
  end
end

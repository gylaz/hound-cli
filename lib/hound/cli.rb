require "hound"

module Hound
  class Cli
    def self.run(arguments)
      if arguments.first == "config"
        puts Hound.config
      end
    end
  end
end

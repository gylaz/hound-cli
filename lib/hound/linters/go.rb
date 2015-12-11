require "delegate"

module Hound
  module Linter
    class Go < SimpleDelegator
      def config
        "Does not support configuration"
      end
    end
  end
end

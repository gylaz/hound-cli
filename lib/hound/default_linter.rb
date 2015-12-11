require "delegate"

module Hound
  class DefaultLinter < SimpleDelegator
    def status
      "Enabled by default"
    end

    def default?
      true
    end
  end
end

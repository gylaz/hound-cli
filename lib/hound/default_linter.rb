require "delegate"

module Hound
  class DefaultLinter < SimpleDelegator
    def enabled?
      true
    end

    def default?
      true
    end
  end
end

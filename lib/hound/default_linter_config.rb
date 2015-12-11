module Hound
  class DefaultLinterConfig < SimpleDelegator
    STATUS = "Using default config"

    def status
      STATUS
    end
  end
end

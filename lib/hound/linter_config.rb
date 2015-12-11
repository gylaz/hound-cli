module Hound
  class LinterConfig
    attr_reader :filepath

    def initialize(name:, filepath:)
      @name = name
      @filepath = filepath
    end

    def status
      "Using #{filepath}"
    end
  end
end

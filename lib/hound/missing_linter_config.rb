require "delegate"

module Hound
  class MissingLinterConfig < SimpleDelegator
    def status
      "Config file #{filepath} does not exist"
    end
  end
end

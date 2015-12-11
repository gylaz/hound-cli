require "delegate"

module Hound
  class MissingLinterConfig < SimpleDelegator
    def status
      "#{filepath} does not exist"
    end
  end
end

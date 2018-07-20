module Hound
  module Format
    def self.error(text)
      "\e[31m#{text}\e[0m"
    end
  end
end

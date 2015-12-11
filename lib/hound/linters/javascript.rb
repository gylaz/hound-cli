require "delegate"
require "json"

module Hound
  module Linter
    class Javascript < SimpleDelegator
      def config
        handle_config_errors do
          parse_config
        end
      end

      private

      def parse_config
        JSON.parse(File.read(filepath))
        "Using #{filepath}"
      rescue JSON::ParserError
        "#{filepath} is invalid JSON"
      end
    end
  end
end

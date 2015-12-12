module Hound
  module Linter
    class Javascript < SimpleDelegator
      def config
        parse_config_result { |file_content| JSON.parse(file_content) }
      rescue JSON::ParserError
        Format.error("#{filepath} is invalid JSON")
      end
    end
  end
end

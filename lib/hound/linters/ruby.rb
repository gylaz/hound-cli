module Hound
  module Linter
    class Ruby < SimpleDelegator
      def config
        parse_config_result { |file_content| YAML.load(file_content) }
      rescue Psych::SyntaxError
        Format.error("#{filepath} is invalid YAML")
      end
    end
  end
end

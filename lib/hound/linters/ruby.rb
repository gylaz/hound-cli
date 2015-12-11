module Hound
  module Linter
    class Ruby < SimpleDelegator
      def config
        handle_config_errors do
          parse_config
        end
      end

      private

      def parse_config
        YAML.load(File.read(filepath))
        "Using #{filepath}"
      rescue Psych::SyntaxError
        "#{filepath} is invalid YAML".colorize(:red)
      end
    end
  end
end

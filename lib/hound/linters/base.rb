module Hound
  module Linter
    class Base
      # status
      # config status
      # configuration
      attr_reader :name

      def initialize(name:, options:)
        @name = name
        @options = options
      end

      def status
        if enabled?
          "Enabled"
        else
          "Disabled"
        end
      end

      def filepath
        options["config_file"]
      end

      def parse_config_result &parse_command
        if filepath
          parse_command.call(file_content)
          "Using #{filepath}"
        else
          "Not provided -- using default"
        end
      rescue Errno::ENOENT
        Format.error("#{filepath} does not exist")
      end

      private

      attr_reader :options

      def enabled?
        options.fetch("enabled", true)
      end

      def file_content
        File.read(filepath)
      end

      def options
        @options || {}
      end
    end
  end
end

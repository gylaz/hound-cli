require "yaml"

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

      def config
        if filepath
          YAML.load(File.read(filepath))
          "Using #{filepath}"
        else
          "Not provided -- using default"
        end
      rescue Errno::ENOENT
        "#{filepath} does not exist"
      rescue Psych::SyntaxError
        "#{filepath} is invalid Yaml"
      end

      private

      attr_reader :options

      def filepath
        options["config_file"]
      end

      def enabled?
        options.fetch("enabled", true)
      end

      def options
        @options || {}
      end
    end
  end
end

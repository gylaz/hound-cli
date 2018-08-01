# frozen_string_literals: true
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

      def handle_config_errors
        if filepath
          yield
        else
          "Not provided -- using default"
        end
      rescue Errno::ENOENT
        "#{filepath} does not exist".colorize(:red)
      end

      private

      attr_reader :options

      def enabled?
        options.fetch("enabled", true)
      end

      def options
        @options || {}
      end
    end
  end
end

require "hound/linter_config"
require "hound/missing_linter_config"
require "hound/default_linter_config"

module Hound
  class Linter
    attr_reader :name

    def initialize(name:, options:)
      @name = name
      @options = options
    end

    def enabled?
      options.fetch("enabled", true)
    end

    def default?
      false
    end

    def config_status
      config.status
    end

    private

    def config
      if config_filepath.nil?
        DefaultLinterConfig.new(linter_config)
      elsif !File.exists?(config_filepath)
        MissingLinterConfig.new(linter_config)
      else
        linter_config
      end
    end

    def linter_config
      LinterConfig.new(name: name, filepath: config_filepath)
    end

    def config_filepath
      options["config_file"]
    end

    attr_reader :options
  end
end

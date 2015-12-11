require "hound/linter"
require "hound/default_linter"
require "yaml"

module Hound
  class Config
    CONFIG_FILENAME = ".hound.yml"
    SUPPORTED_LINTER_NAMES = %w(
      ruby
      javascript
      go
    )
    ENABLED_LINTER_NAMES = %w(
      ruby
      javascript
    )

    def unconfigured_linters
      unconfigured_linter_names.map do |name|
        DefaultLinter.new(Linter.new(name: name, options: {}))
      end
    end

    def configured_linters
      configured_linter_names.map do |name, options|
        Linter.new(name: name, options: options)
      end
    end

    private

    def configured_linter_names
      content.select do |name, _|
        SUPPORTED_LINTER_NAMES.include?(name)
      end
    end

    def unconfigured_linter_names
      ENABLED_LINTER_NAMES - configured_linters.map(&:name)
    end

    def content
      @content ||= YAML.load(File.read(CONFIG_FILENAME))
    end
  end
end

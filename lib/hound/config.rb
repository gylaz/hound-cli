require "hound/linter"
require "hound/default_linter"

module Hound
  class Config
    CONFIG_FILENAME = ".hound.yml"
    ENABLED_LINTER_NAMES = %w(
      ruby
      javascript
    )

    def unconfigured_linters
      unconfigured_linter_names.map do |name|
        DefaultLinter.new(Linter.new(name: name, config: {}))
      end
    end

    def configured_linters
      content.map do |name, config|
        Linter.new(name: name, config: config)
      end
    end

    private

    def unconfigured_linter_names
      ENABLED_LINTER_NAMES - configured_linters.map(&:name)
    end

    def content
      @content ||= YAML.load(File.read(CONFIG_FILENAME))
    end
  end
end

require "hound/version"
require "hound/config"
require "yaml"

module Hound
  USING_DEFAULTS = "You are using the Hound defaults. Add a .hound.yml to configure Hound."

  def self.config
    config = Config.new

    (report_configured_linters(config) + report_default_linters(config)).join
  rescue Psych::SyntaxError
    "Your .hound.yml file is not valid Yaml"
  rescue Errno::ENOENT
    USING_DEFAULTS
  end

  def self.linter_status(linter)
    if linter.enabled?
      "Enabled"
    else
      "Disabled"
    end
  end

  def self.report_configured_linters(config)
    config.configured_linters.map do |linter|
      <<-RESULT
#{linter.name.capitalize}
  - #{linter_status(linter)}
      RESULT
    end
  end

  def self.report_default_linters(config)
    config.unconfigured_linters.map do |unconfigured_linter|
      <<-RESULT
#{unconfigured_linter.name.capitalize}
  - Enabled (default)
      RESULT
    end
  end
end

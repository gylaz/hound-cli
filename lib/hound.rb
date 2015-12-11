require "hound/version"
require "hound/config"

module Hound
  USING_DEFAULTS = "You are using the Hound defaults. Add a .hound.yml to configure Hound."

  def self.config
    config = Config.new
    linters = config.configured_linters + config.unconfigured_linters

    report(linters)
  rescue Psych::SyntaxError
    "Your .hound.yml file is not valid Yaml"
  rescue Errno::ENOENT
    USING_DEFAULTS
  end

  def self.report(linters)
    linters.map { |linter| linter_report(linter) }.join("\n")
  end

  def self.linter_report(linter)
    <<-RESULT
#{linter.name.capitalize}
  - #{linter_status(linter)}
  - #{linter.config_status}
    RESULT
  end

  def self.linter_status(linter)
    if linter.enabled?
      status = "Enabled"

      if linter.default?
        status + " (default)"
      else
        status
      end
    else
      "Disabled"
    end
  end
end

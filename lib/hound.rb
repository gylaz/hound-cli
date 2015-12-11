require "hound/version"
require "hound/config"

module Hound
  USING_DEFAULTS = "You are using the Hound defaults. Add a .hound.yml to configure Hound."

  def self.config
    report(Config.new.linters)
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
---------
  Status: #{linter.status}
  Config: #{linter.config}
    RESULT
  end
end

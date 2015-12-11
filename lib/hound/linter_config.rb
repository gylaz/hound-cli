module Hound
  class LinterConfig
    attr_reader :filepath

    def initialize(filepath)
      @filepath = filepath
    end

    def status
      YAML.load(File.read(filepath))

      "Using #{filepath}"
    rescue Psych::SyntaxError
      "#{filepath} is not valid Yaml"
    end
  end
end

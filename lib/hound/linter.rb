module Hound
  class Linter
    attr_reader :name

    def initialize(name:, config:)
      @name = name
      @config = config
    end

    def enabled?
      config["enabled"]
    end

    def default?
      false
    end

    private

    attr_reader :config
  end
end

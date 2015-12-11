module Hound
  class Config
    CONFIG_FILENAME = ".hound.yml"
    LINTER_NAMES = %w(
      ruby
      javascript
      go
    )

    def linters
      LINTER_NAMES.map do |name|
        build_linter(name, content[name])
      end
    end

    private

    def build_linter(name, options)
      base_linter = Linter::Base.new(name: name, options: options)
      linter_class = "Hound::Linter::#{name.capitalize}".
        split("::").
        reduce(Object) { |object, constant| object.const_get(constant) }

      linter_class.new(base_linter)
    end

    def content
      @content ||= YAML.load(File.read(CONFIG_FILENAME))
    end
  end
end

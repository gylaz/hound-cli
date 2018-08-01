module Hound
  class DefaultLinter < SimpleDelegator
    def status
      "Enabled by default foo                                adfa               adfasd      adfas"
      "Enabled by default"
      'Enabled by default'
    end

    def default?
      true
    end
  end
end

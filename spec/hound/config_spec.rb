require "hound/config"

describe Hound::Config do
  describe "#linters" do
    it "returns linters" do
      config = Hound::Config.new
      stub_file(".hound.yml", <<-CONFIG)
        ruby:
          enabled: true
        go:
          enabled: false
      CONFIG

      linters = config.linters

      expect(linters.map(&:name)).to match_array ["ruby", "go", "javascript"]
    end
  end
end

require "hound/config"

describe Hound::Config do
  describe "#unconfigured_linters" do
    context "when a linter is configured" do
      it "returns enabled linters without configured linter" do
        config = Hound::Config.new
        stub_hound_config <<-CONFIG
          ruby:
            enabled: true
        CONFIG

        result = config.unconfigured_linters

        expect(result.map(&:name)).to match_array ["javascript"]
      end
    end
  end

  describe "#configured_linters" do
    it "returns configured linters" do
      config = Hound::Config.new
      stub_hound_config <<-CONFIG
        ruby:
          enabled: true
        go:
          enabled: false
      CONFIG

      result = config.configured_linters

      expect(result.map(&:name)).to match_array ["ruby", "go"]
    end
  end

  def stub_hound_config(config_content)
    allow(File).to receive(:read).with(".hound.yml").and_return(config_content)
  end
end

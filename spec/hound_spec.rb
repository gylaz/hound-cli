require "hound"

describe Hound do
  it "has a version number" do
    expect(Hound::VERSION).not_to be nil
  end

  describe ".config" do
    context "when .hound.yml is not valid Yaml" do
      it "returns helpful message" do
        stub_file ".hound.yml",  <<-CONFIG
          blahh:
          blahh
        CONFIG

        result = Hound.config

        expect(result).to eq "Your .hound.yml file is not valid Yaml"
      end
    end

    context "when .hound.yml does not exist" do
      it "returns defaults" do
        result = Hound.config

        expect(result).to eq Hound::USING_DEFAULTS
      end
    end

    context "when a language is explicitly enabled" do
      it "returns a message explaining which languages are enabled" do
        stub_file ".hound.yml", <<-CONFIG
          ruby:
            enabled: true
          go:
            enabled: false
        CONFIG

        result = Hound.config

        expect(result).to eq <<-RESULT
Ruby
---------
  Status: Enabled
  Config: Not provided -- using default

Javascript
---------
  Status: Enabled
  Config: Not provided -- using default

Go
---------
  Status: Disabled
  Config: Does not support configuration
        RESULT
      end
    end
  end
end

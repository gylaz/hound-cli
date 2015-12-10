describe Hound do
  it "has a version number" do
    expect(Hound::VERSION).not_to be nil
  end

  describe ".config" do
    context "when .hound.yml is not valid Yaml" do
      it "returns helpful message" do
        stub_hound_config <<-CONFIG
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
        stub_hound_config <<-CONFIG
          ruby:
            enabled: true
        CONFIG

        result = Hound.config

        expect(result).to eq <<-RESULT
Ruby
  - Enabled
Javascript
  - Enabled (default)
        RESULT
      end
    end
  end

  def stub_hound_config(config_content)
    allow(File).to receive(:read).with(".hound.yml").and_return(config_content)
  end
end

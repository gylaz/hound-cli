require "hound/linter"

describe Hound::Linter do
  describe "#enabled?" do
    context "when linter is enabled" do
      it "returns true" do
        options = { "enabled" => true }
        linter = Hound::Linter.new(name: "foo", options: options)

        expect(linter).to be_enabled
      end
    end

    context "when linter is disabled"
  end

  describe "#config_status" do
    context "when config file does not exist" do
      it "returns missing config object" do
        options = { "config_file" => "path/to/nothing" }
        linter = Hound::Linter.new(name: "foo", options: options)

        result = linter.config_status

        expect(result).to eq "Config file path/to/nothing does not exist"
      end
    end

    context "when config_file key isn't specified" do
      it "returns default linter config" do
        linter = Hound::Linter.new(name: "foo", options: {})

        result = linter.config_status

        expect(result).to eq Hound::DefaultLinterConfig::STATUS
      end
    end
  end
end

require "hound/linter_config"

describe Hound::LinterConfig do
  describe "#status" do
    context "when file is valid Yaml" do
      it "returns message with filepath" do
        filepath = ".ruby-style.yml"
        linter_config = Hound::LinterConfig.new(filepath)
        stub_file(filepath, "foo:\n  bar")

        expect(linter_config.status).to eq "Using .ruby-style.yml"
      end
    end

    context "when file is invalid Yaml" do
      it "returns error message" do
        filepath = ".ruby-style.yml"
        linter_config = Hound::LinterConfig.new(filepath)
        stub_file(filepath, "foo:\nbar")

        expect(linter_config.status).to include "not valid"
      end
    end
  end
end

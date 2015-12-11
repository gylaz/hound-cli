require "hound/linters/base"

describe Hound::Linter::Base do
  describe "#status" do
    context "when linter is enabled" do
      it "returns Enabled" do
        linter = Hound::Linter::Base.new(
          name: "foo",
          options: { "enabled" => true },
        )

        expect(linter.status).to eq "Enabled"
      end
    end

    context "when linter is disabled" do
      it "returns Disabled" do
        linter = Hound::Linter::Base.new(
          name: "foo",
          options: { "enabled" => false },
        )

        expect(linter.status).to eq "Disabled"
      end
    end
  end

  describe "#config" do
    context "when config is provided" do
      it "returns a success message" do
        linter = build_linter("config_file" => ".foo-style.yml")
        stub_file(".foo-style.yml", "foo bar")

        expect(linter.config).to eq "Using .foo-style.yml"
      end
    end

    context "when config is not provided" do
      it "returns a default message" do
        linter = build_linter({})

        expect(linter.config).to eq "Not provided -- using default"
      end
    end

    context "when config file cannot be found" do
      it "returns an error message" do
        linter = build_linter("config_file" => ".foo-style.yml")

        expect(linter.config).to eq ".foo-style.yml does not exist"
      end
    end

    context "when config cannot be parsed" do
      it "returns an error message" do
        linter = build_linter("config_file" => ".foo-style.yml")
        stub_file(".foo-style.yml", "foo:\nbar")

        expect(linter.config).to eq ".foo-style.yml is invalid Yaml"
      end
    end
  end

  def build_linter(options = {})
    Hound::Linter::Base.new(name: "foo", options: options)
  end
end

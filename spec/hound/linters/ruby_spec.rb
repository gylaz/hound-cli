describe Hound::Linter::Ruby do
  describe "#status" do
    it "delegates to base linter" do
      base_linter = instance_double("Hound::Linter::Base", status: "Enabled")
      linter = Hound::Linter::Ruby.new(base_linter)

      expect(linter.status).to eq "Enabled"
    end
  end

  describe "#config" do
    context "when config is provided" do
      it "returns a success message" do
        filepath = ".ruby-style.yaml"
        linter = build_linter(filepath)
        stub_file(filepath, "Enabled: true")

        expect(linter.config).to eq "Using #{filepath}"
      end
    end

    context "when config file cannot be found" do
      it "returns an error message" do
        linter = build_linter(".foo-style.yml")

        expect(linter.config).to include ".foo-style.yml does not exist"
      end
    end

    context "when config is not provided" do
      it "returns a default message" do
        linter = build_linter(nil)

        expect(linter.config).to eq "Not provided -- using default"
      end
    end

    context "when config cannot be parsed" do
      it "returns an error message" do
        filepath = ".ruby-style.yaml"
        stub_file(filepath, "Enabled:\ntrue")
        linter = build_linter(filepath)

        expect(linter.config).to include "#{filepath} is invalid YAML"
      end
    end
  end

  def build_linter(filepath)
    options = { "config_file" => filepath }.reject { |key, value| value.nil? }
    base_linter = Hound::Linter::Base.new(name: "ruby", options: options)
    Hound::Linter::Ruby.new(base_linter)
  end
end

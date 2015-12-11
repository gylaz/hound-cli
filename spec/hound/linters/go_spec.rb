require "hound/linters/go"

describe Hound::Linter::Go do
  describe "#status" do
    it "delegates to base linter" do
      base_linter = instance_double("Hound::Linter::Base", status: "Enabled")
      linter = Hound::Linter::Go.new(base_linter)

      expect(linter.status).to eq "Enabled"
    end
  end
end

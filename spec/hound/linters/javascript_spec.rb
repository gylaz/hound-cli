require "hound/linters/javascript"

describe Hound::Linter::Javascript do
  describe "#status" do
    it "delegates to base linter" do
      base_linter = instance_double("Hound::Linter::Base", status: "Enabled")
      linter = Hound::Linter::Javascript.new(base_linter)

      expect(linter.status).to eq "Enabled"
    end
  end
end

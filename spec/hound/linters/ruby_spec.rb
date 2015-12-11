require "hound/linters/ruby"

describe Hound::Linter::Ruby do
  describe "#status" do
    it "delegates to base linter" do
      base_linter = instance_double("Hound::Linter::Base", status: "Enabled")
      linter = Hound::Linter::Ruby.new(base_linter)

      expect(linter.status).to eq "Enabled"
    end
  end
end

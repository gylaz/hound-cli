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

  def build_linter(options = {})
    Hound::Linter::Base.new(name: "foo", options: options)
  end
end

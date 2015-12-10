describe Hound::Linter do
  describe "#enabled?" do
    context "when linter is enabled" do
      it "returns true" do
        config = { "enabled" => true }
        linter = Hound::Linter.new(name: "foo", config: config)

        expect(linter).to be_enabled
      end
    end

    context "when linter is disabled"
  end
end

require "hound/cli"

describe Hound::Cli do
  context "with 'config' argument" do
    it "prints the status of the current config" do
      allow(Hound).to receive(:config).and_return "Config"

      expect { Hound::Cli.run(["config"]) }.to output("Config\n").to_stdout
    end
  end
end

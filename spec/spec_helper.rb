$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "byebug"
require "hound"

def stub_file(filename, config_content)
  allow(File).to receive(:read).with(filename).and_return(config_content)
end

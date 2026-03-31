class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.0"
  url "file:///Users/taras/projects/dualentry-cli/dist/dualentry"
  sha256 "10b98eb972e893bce1d2c29fa1a71efa8f4bf3cbc4d9fe40886f142e949268c0"

  def install
    bin.install "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

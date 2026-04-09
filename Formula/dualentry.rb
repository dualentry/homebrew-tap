class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.10/dualentry-macos-arm64"
      sha256 "8350e69919276d87efdfc61bee12c1aa7048b0456629e0b59ca89a8bc70bce14"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.10/dualentry-macos-x86_64"
      sha256 "70626841a0e50eebbb480b269b2920b7340651c74c685cd5830e3455268d57fc"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.10/dualentry-linux-x86_64"
    sha256 "264359b1a9862300a5e851d3863db7814a0c4def0b2d17449c96db32737d39cc"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

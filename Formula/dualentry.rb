class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.6/dualentry-macos-arm64"
      sha256 "afc4fe1cfaa7317c80f38a193b3895f4a3fd2289950563b01902a011d6f37c3c"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.6/dualentry-macos-x86_64"
      sha256 "92256cad2544ccbce2cdf55097dc69aa2c53f46f365ec5ece3a9d623a7e47460"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.6/dualentry-linux-x86_64"
    sha256 "3eeb2709b7916dbf1cbe1fde998a69b1abf741242fe8a8969fdefa3bd4b0f6f9"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

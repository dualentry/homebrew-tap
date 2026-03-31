class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.3/dualentry-macos-arm64"
      sha256 "bd5a16f957c5459a7cc15b168464e74dfdf1b45f6f019868c570d64c0e40cc6e"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.3/dualentry-macos-x86_64"
      sha256 "291b8956e354f14549634dffc9b3feeaa80e76529c5b9e47f67996c7eedadbb3"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.3/dualentry-linux-x86_64"
    sha256 "9c5d5bd71f72e0b385e7f40cfa7a165e8d8fda2c55a9d7f0b20cc147c6f53fa5"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

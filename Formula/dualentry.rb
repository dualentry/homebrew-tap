class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.5/dualentry-macos-arm64"
      sha256 "0a40ca89ada76511d6560fabd2aaf26d135c2244a6b025ba9e316c2aaca913c8"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.5/dualentry-macos-x86_64"
      sha256 "d41c24251b43fc9d2beed4667f29f31cd6ce466a80a9e1980af5bbcbfeddf459"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.5/dualentry-linux-x86_64"
    sha256 "488b4b208db593a617eddf69ec3c30d48d2a3d8024a6c56c5aafbbdab66df275"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

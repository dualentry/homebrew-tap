class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.8/dualentry-macos-arm64"
      sha256 "d9bda04594036de1874ed55415ea315ffedf94551432a02a1dfd812bbd466351"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.8/dualentry-macos-x86_64"
      sha256 "261c20f53339e7ce3eca3a5cf4ed86c797d3f6b040a6d810e81f3f28092d323e"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.8/dualentry-linux-x86_64"
    sha256 "30d6fb2249eacf39392f5e7344efe024de78357f99ee5d1a06ac72cc983a9131"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

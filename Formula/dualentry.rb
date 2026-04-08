class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.9/dualentry-macos-arm64"
      sha256 "4d9f805321a8dea7373a849146a5f2f3f6a2db6f96153fa68b053de9318fa76a"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.9/dualentry-macos-x86_64"
      sha256 "f834f172a97b736194a58fc8c8bcef3bc1ddbd9f934f762b9bc1078e9b420294"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.9/dualentry-linux-x86_64"
    sha256 "cc0a2df8e621a7eb745f8e0389aed8bd3a08333d74e4dc67b238b8b2ecd016e5"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

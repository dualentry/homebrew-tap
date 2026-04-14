class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.16/dualentry-macos-arm64.tar.gz"
      sha256 "e7fe896ca9e3dc4823a4fa3e7b9ef9ee12cf88a7d9754b84e33d909debb64931"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.16/dualentry-macos-x86_64.tar.gz"
      sha256 "9dc616f4dfebb7620f2fb499ee72fdc70888e0925271c617a294d8dab3c8c6ea"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.16/dualentry-linux-x86_64.tar.gz"
    sha256 "6d22a632a52585aaa11e58941b2891c8876f7acb0a0eb49214fae4ad465d393b"
  end

  def install
    libexec.install "dualentry"
    libexec.install "_internal"
    bin.install_symlink libexec/"dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

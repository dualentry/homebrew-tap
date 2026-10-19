class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.20/dualentry-macos-arm64.tar.gz"
      sha256 "ba1719ead7147439cf34d6a0d151d1f57a0d954d7b779679e72ae9bca8f81025"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.20/dualentry-macos-x86_64.tar.gz"
      sha256 "3ad989a222c2c64b60862e9f64645332e5e2dd320a7f6c8126a3ef28bae7c6ab"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.20/dualentry-linux-x86_64.tar.gz"
    sha256 "c410c00c56e39a68a0414d99eff9eac5fcf5d26140972b5337da7078b2521f0e"
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

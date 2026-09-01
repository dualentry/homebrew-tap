class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.18/dualentry-macos-arm64.tar.gz"
      sha256 "8502a7bf3d24516477e7ee63846fcebb456fbc5ed84baf7f214047121766aeec"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.18/dualentry-macos-x86_64.tar.gz"
      sha256 "844991d2580f2927053fbc92bd69e34a846a2bc72f29e7aaa41542e9479259d1"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.18/dualentry-linux-x86_64.tar.gz"
    sha256 "61a86c26e2844313e2e3b8433c2520a16e5e8ef9e6158602d70d198ad48e7657"
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

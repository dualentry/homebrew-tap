class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.14/dualentry-macos-arm64.tar.gz"
      sha256 "42c0832f5dceb4b6ea2e2bb55b9742dfbbf34b14da26dedd05c4b58018147fe5"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.14/dualentry-macos-x86_64.tar.gz"
      sha256 "74af24fd294be9ea5796ca21a9ed4168c3693ae4b8942b97b876d27e80457ee9"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.14/dualentry-linux-x86_64.tar.gz"
    sha256 "72c7be54e81420882d4440a16edacbe6ebbe606fc7d804976c7462647658059d"
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

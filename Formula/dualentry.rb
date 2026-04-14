class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.12/dualentry-macos-arm64.tar.gz"
      sha256 "cb8bfe0b092c9d47af547e714f6fea972d38fd00cb9bdcf36350db6bff86e3a5"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.12/dualentry-macos-x86_64.tar.gz"
      sha256 "e6bb7d4eff86a33bc472b544e6170228b82c6bcc3fc26eafcfe7f30fa4844ecf"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.12/dualentry-linux-x86_64.tar.gz"
    sha256 "c56f0374272930a71ced3461bc0d28486d705effa532c5aa9a6546d92a135fc4"
  end

  def install
    libexec.install Dir["dualentry/*"]
    bin.install_symlink libexec/"dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

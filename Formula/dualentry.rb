class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.15/dualentry-macos-arm64.tar.gz"
      sha256 "949ee055608c9c2f0fe4f429a85aaf5d435a183a4a544ffa106f73b701ec9eca"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.15/dualentry-macos-x86_64.tar.gz"
      sha256 "0009407a46d1becfe5bad70e52a0d38c4474cb9ac28acabf73ce99216ca44d70"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.15/dualentry-linux-x86_64.tar.gz"
    sha256 "312e46ec81f30e503df04650bcab7ada649950c40fe79d8301a20752b51aa69e"
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

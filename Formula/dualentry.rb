class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.17/dualentry-macos-arm64.tar.gz"
      sha256 "0ad34ca06ea80605a3f05c90ba0cd38b0c0aadf18790ff952dd35c373aed86f6"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.17/dualentry-macos-x86_64.tar.gz"
      sha256 "81e1be0ef195e921d8bf161873dd65911d9564dc9e201b61d124d7f680c6fbb6"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.17/dualentry-linux-x86_64.tar.gz"
    sha256 "2bf2d30fc5d5173ddf7408c3d864dda2b2ec83f8fd6245592bc85f021e98c656"
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

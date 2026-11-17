class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.22/dualentry-macos-arm64.tar.gz"
      sha256 "cdd07bf0f6cf16e2c5e14335ed963f69318dc4e507d22e5b7e1860e2bf7ddbc1"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.22/dualentry-macos-x86_64.tar.gz"
      sha256 "33d4257087edc6a952e8fa88e3daf21cdfe520ac7dd4183353f3357d0891a885"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.22/dualentry-linux-x86_64.tar.gz"
    sha256 "f46044f99bdac990491f3b754d11b0b0cbd1548793125ea38b3cdb7c12f6192b"
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

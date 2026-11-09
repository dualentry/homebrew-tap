class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.21/dualentry-macos-arm64.tar.gz"
      sha256 "96cbcaf2201f23c801f48ea898d2664f325a4e85a34f75afa26e1841586b73be"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.21/dualentry-macos-x86_64.tar.gz"
      sha256 "fc19772355bbf313b1daa7260555937a5c40fd74ef71dec2b187c5f9d4768975"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.21/dualentry-linux-x86_64.tar.gz"
    sha256 "0f16a7d5dc79f01dedd475798b14036cadd5ae0feede2bc586cd02b7981eb5a9"
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

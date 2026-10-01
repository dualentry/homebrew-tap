class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.19/dualentry-macos-arm64.tar.gz"
      sha256 "6a7079839ab31853cfca8098d4d2802fadca28d87900010414772047076739f1"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.19/dualentry-macos-x86_64.tar.gz"
      sha256 "67afe8e4e24256fdd43f8b91777d710c3e9833fb64418f282d6952270fef2571"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.19/dualentry-linux-x86_64.tar.gz"
    sha256 "62b3d077b933942fcdc4d281422a86260799867201f44134dd127d41823a8414"
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

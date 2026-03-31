class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.4/dualentry-macos-arm64"
      sha256 "9433b87385e4322e8b3acda8f8dc3499f4cabb7fc72af93d83a53bd516f08979"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.4/dualentry-macos-x86_64"
      sha256 "793cbe4ce522b700ecfdb256c3dab3deac8ff8d95c14c0ef4d5199b50d426895"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.4/dualentry-linux-x86_64"
    sha256 "696f20a2773f821f3511d1046aeaf4b1ace46bfdb99a606c41ba2c2cbb9257ee"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

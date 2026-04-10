class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.11/dualentry-macos-arm64"
      sha256 "2881290debc9d254db8c466f5014ac3e91d07c43fb997fb6cc0f6079328c7f00"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.11/dualentry-macos-x86_64"
      sha256 "b19e850cee21bdeb6552a6c7a072d3eefdc7f7b7d82a39114c099f71cd9cedc3"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.11/dualentry-linux-x86_64"
    sha256 "c44d0a04904835215a14b33a0090a5419e1ab63fcef45ef22fbfed33eea19502"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

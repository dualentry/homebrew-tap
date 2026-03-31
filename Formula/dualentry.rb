class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.2/dualentry-macos-arm64"
      sha256 "8ab96531714b2483f99df983d049d7cba34da4464637a50cfc7be4279bdb09c0"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.2/dualentry-macos-x86_64"
      sha256 "8604fc7a2b12abe92712eee30b5de441e02731b7349ce963beccbd3c35264a8d"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.2/dualentry-linux-x86_64"
    sha256 "ae265af084a73a9859a4e1426c788df8b79dc3a28d5a74cdbee0727d3800d67e"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

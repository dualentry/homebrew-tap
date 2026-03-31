class Dualentry < Formula
  desc "DualEntry accounting CLI"
  homepage "https://github.com/dualentry/dualentry-cli"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.7/dualentry-macos-arm64"
      sha256 "4c2402d262fdcef69d0a831121d2f918b8ac1883d63c7567334847ed09f53e51"
    else
      url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.7/dualentry-macos-x86_64"
      sha256 "beef9e959f89da2cfa12b8cfdefd544cf5ded048c0d49759bf3deebe9f547c3f"
    end
  end

  on_linux do
    url "https://github.com/dualentry/dualentry-cli/releases/download/v0.1.7/dualentry-linux-x86_64"
    sha256 "94dd08dd6ed8fee5f03a646b77d868fee7fa7071c86bc7124dbfa89af29985be"
  end

  def install
    binary = Dir["dualentry-*"].first || "dualentry"
    bin.install binary => "dualentry"
  end

  test do
    assert_match "dualentry-cli", shell_output("#{bin}/dualentry --version")
  end
end

class Muse < Formula
  desc "Apple Music in your terminal"
  homepage "https://github.com/songhyun-k/muse"
  url "https://github.com/songhyun-k/muse/releases/download/v0.1.0/muse-macos-arm64.tar.gz"
  sha256 "1df0df377fad61200cfc7d5aa898bbd5f2a61ca1260d820a4d7bc2cf37fddea7"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  skip_clean "bin/muse"

  def install
    bin.install "muse"
    pkgshare.install "LICENSE", "NOTICE.md", "THIRD_PARTY_LICENSES.txt"
  end

  test do
    assert_match "muse #{version}", shell_output("#{bin}/muse --version")
    system bin/"muse", "--demo", "--probe"
  end
end

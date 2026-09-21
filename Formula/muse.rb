class Muse < Formula
  desc "Apple Music in your terminal"
  homepage "https://github.com/songhyun-k/muse"
  url "https://github.com/songhyun-k/muse/releases/download/v0.3.0/muse-macos-arm64.tar.gz"
  sha256 "08b0853f5597b728e9791c7eaeec69bda7a2a07810eccdfd43713a7ac79b3a21"
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

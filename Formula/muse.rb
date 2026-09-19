class Muse < Formula
  desc "Apple Music in your terminal"
  homepage "https://github.com/songhyun-k/muse"
  url "https://github.com/songhyun-k/muse/releases/download/v0.2.0/muse-macos-arm64.tar.gz"
  sha256 "8a38b154f40d58286024e75e13b0c140c3598aaa723aa2ff94d38c06b23ebe81"
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

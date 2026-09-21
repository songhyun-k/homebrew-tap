class Muse < Formula
  desc "Apple Music in your terminal"
  homepage "https://github.com/songhyun-k/muse"
  url "https://github.com/songhyun-k/muse/releases/download/v0.3.2/muse-macos-arm64.tar.gz"
  sha256 "9423ae76d602875c376c69a348ee0bec931aeaed45e3767dd2106cb3e228f1d3"
  license "MIT"

  bottle do
    root_url "https://github.com/songhyun-k/muse/releases/download/v0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cf619a2890fea9e0d1f9576f607dd9adcbe1bc037b10e8e5433b85dee94139ac"
  end

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

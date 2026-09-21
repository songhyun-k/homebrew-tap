class Muse < Formula
  desc "Apple Music in your terminal"
  homepage "https://github.com/songhyun-k/muse"
  url "https://github.com/songhyun-k/muse/releases/download/v0.3.1/muse-macos-arm64.tar.gz"
  sha256 "54167632813adf040a1ec6eb35f04d8b580070ccdde592c2f7fcd64ce72223a1"
  license "MIT"

  bottle do
    root_url "https://github.com/songhyun-k/muse/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0a7edba7f81b1dc82ea55f2812a9e918008b4e2ac3b53d2ec9e24104abc6471"
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

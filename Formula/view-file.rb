class ViewFile < Formula
  desc "Format-aware terminal and macOS file viewer"
  homepage "https://github.com/matoi/view-file"
  url "https://github.com/matoi/view-file.git",
      tag:      "v0.1.0",
      revision: "8decf817f6459aa5292f9be09f33b3d02805f5ea"
  license "GPL-3.0-or-later"
  head "https://github.com/matoi/view-file.git", branch: "main"

  depends_on "bat"
  depends_on "glow"
  depends_on "jq"
  depends_on :macos
  depends_on "matoi/tap/less-migemo"
  depends_on "matoi/tap/lesspipe-plus"
  depends_on "nkf"
  depends_on "pandoc"

  def install
    bin.install "bin/view-file"
  end

  test do
    assert_match "usage: view-file", shell_output("#{bin}/view-file --help 2>&1")
    assert_match "hello", pipe_output("#{bin}/view-file --terminal --type source -", "hello\n")
  end
end

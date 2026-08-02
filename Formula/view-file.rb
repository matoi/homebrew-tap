class ViewFile < Formula
  desc "Format-aware terminal and macOS file viewer"
  homepage "https://github.com/matoi/view-file"
  url "https://github.com/matoi/view-file.git",
      tag:      "v0.1.1",
      revision: "5defa45add0130cc5b1d6dbc993d4171167a31ea"
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
    bin.install_symlink "view-file" => "vf"
  end

  test do
    assert_match "usage: view-file", shell_output("#{bin}/view-file --help 2>&1")
    assert_match "usage: view-file", shell_output("#{bin}/vf --help 2>&1")
    assert_match "hello", pipe_output("#{bin}/view-file --type source -", "hello\n")
  end
end

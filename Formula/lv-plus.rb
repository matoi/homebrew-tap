class LvPlus < Formula
  desc "Extended multilingual file viewer and grep"
  homepage "https://github.com/matoi/lv"
  url "https://github.com/matoi/lv.git",
      revision: "d103f416ff4376891ff65bc38e610652aa8fa137"
  version "4.51-plus.1"
  license "GPL-2.0-or-later"
  head "https://github.com/matoi/lv.git", branch: "feature/cmigemo"

  depends_on "cmigemo"

  uses_from_macos "ncurses"

  conflicts_with "lv", because: "both install an lv executable"

  def install
    cd "build" do
      system "../src/configure",
             "--prefix=#{prefix}",
             "--with-cmigemo=#{formula_opt_prefix("cmigemo")}"
      system "make"
      bin.install "lv"
      bin.install_symlink "lv" => "lgrep"
    end

    man1.install "lv.1"
    (lib/"lv").install "lv.hlp"
  end

  test do
    (testpath/"search.txt").write <<~EOS
      検索結果
      無関係
      kensaku literal
    EOS

    assert_equal "検索結果\nkensaku literal\n",
                 shell_output("#{bin}/lv -M -g kensaku #{testpath}/search.txt")
  end
end

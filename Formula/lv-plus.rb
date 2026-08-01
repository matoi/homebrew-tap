class LvPlus < Formula
  desc "Extended multilingual file viewer and grep"
  homepage "https://github.com/matoi/lv"
  url "https://github.com/matoi/lv.git",
      revision: "ea2a7d2e845305f65baaf8ef36d9adb20d515fba"
  version "4.51-plus.2"
  license "GPL-2.0-or-later"
  head "https://github.com/matoi/lv.git", branch: "plus"

  depends_on "cmigemo"
  depends_on "highlight"

  uses_from_macos "ncurses"

  conflicts_with "lv", because: "both install an lv executable"

  def install
    cd "build" do
      system "../src/configure",
             "--prefix=#{prefix}",
             "--with-cmigemo=#{formula_opt_prefix("cmigemo")}",
             "--with-highlight=#{formula_opt_prefix("highlight")}"
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

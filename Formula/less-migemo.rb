class LessMigemo < Formula
  desc "Pager with C/Migemo search support"
  homepage "https://github.com/matoi/less"
  url "https://github.com/matoi/less.git",
      revision: "f84e515a89f9ccaf1339c5ff63786a9240393b5a"
  version "708-migemo.1"
  license "GPL-3.0-or-later"
  head "https://github.com/matoi/less.git", branch: "feature/migemo"

  depends_on "autoconf" => :build
  depends_on "groff" => :build
  depends_on "cmigemo"
  depends_on "ncurses"
  depends_on "pcre2"

  uses_from_macos "perl" => :build

  conflicts_with "less", because: "both install a less executable"

  def install
    system "make", "-f", "Makefile.aut", "distfiles"
    system "./configure",
           "--prefix=#{prefix}",
           "--with-regex=pcre2",
           "--with-migemo=#{formula_opt_prefix("cmigemo")}"
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/less --migemo --version")
    assert_match "less 708", output
    refute_match "Warning: cannot enable Migemo", output
    assert_match "--migemo", shell_output("#{bin}/less --help")
  end
end

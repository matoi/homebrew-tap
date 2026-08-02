class LesspipePlus < Formula
  desc "Input filter for less with explicit paths and parser allow-lists"
  homepage "https://github.com/matoi/lesspipe"
  url "https://github.com/matoi/lesspipe/archive/da31461f285ceaa75557b7a105e5cd5945b83570.tar.gz"
  version "2.27-plus.1"
  sha256 "324b57303d14b96df8d5b9dd9980a9faec6e2cbd2b89fba53b55c7e01ac78e25"
  license all_of: [
    "GPL-2.0-only",
    "GPL-2.0-or-later", # sxw2txt
    "MIT", # code2color
    any_of: ["Artistic-1.0-Perl", "GPL-1.0-or-later"], # vimcolor
  ]
  head "https://github.com/matoi/lesspipe.git", branch: "plus"

  uses_from_macos "zsh" => :build
  uses_from_macos "perl"

  on_macos do
    depends_on "bash"
  end

  conflicts_with "lesspipe", because: "both install lesspipe executables"

  def install
    system "./configure", "--prefix=#{prefix}", "--shell=bash"
    system "make", "install"
  end

  test do
    assert_match "LESSPIPE_ALLOWED_COMMANDS", (bin/"lesspipe.sh").read
    assert_match "LESSOPEN", shell_output("#{bin}/lesspipe.sh")
  end
end

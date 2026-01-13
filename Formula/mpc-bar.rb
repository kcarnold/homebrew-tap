class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/kcarnold/mpc-bar"
  url "https://github.com/kcarnold/mpc-bar/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "959ddb06bab083793877f4d9f2f5e644057bd22c4e5e4c9196ce4f541cc641ee"
  license "GPL-2.0-or-later"
  head "https://github.com/kcarnold/mpc-bar.git", branch: "main"

  depends_on "libmpdclient"
  depends_on "lua"

  def install
    system "make", "BINDIR=#{bin}", "install"
  end

  service do
    run opt_bin/"mpc-bar"
    keep_alive true
  end

  test do
    assert_match "MPC Bar "+version.to_s, shell_output("#{bin}/mpc-bar -v")
  end
end

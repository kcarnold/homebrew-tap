class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/kcarnold/mpc-bar"
  url "https://github.com/kcarnold/mpc-bar/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c574e4b21b9c860dc312aa385917f842ffaa5d74de49dbcaa400bf63a439633a"
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

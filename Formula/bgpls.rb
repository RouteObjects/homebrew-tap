class Bgpls < Formula
  desc "Collect BGP Link-State topology and watch routing changes"
  homepage "https://github.com/RouteObjects/bgpls"
  url "https://github.com/RouteObjects/bgpls/releases/download/0.1.0/bgpls-0.1.0-darwin-aarch64.tar.gz"
  sha256 "00bba04fb74791bf7141faa911c8fe23054ff6525c4dd4ba2fc1ec055e4da1bf"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on "python@3.15"

  def install
    bin.install "bin/bgpls"
    libexec.install "libexec/libswiftCompatibilitySpan.dylib"
    pkgshare.install "FRR-LAB.md", "lab-examples"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.txt"
  end

  def caveats
    <<~EOS
      For the five-router FRR demo on a prepared OrbStack guest, see:
        #{opt_pkgshare}/FRR-LAB.md
      The lab scripts and router configurations are in:
        #{opt_pkgshare}/lab-examples/bgpls
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/bgpls --version").strip
    assert_match "--peer", shell_output("#{bin}/bgpls run --help")
    lab = pkgshare/"lab-examples/bgpls"
    assert_match "Containerlab", (pkgshare/"FRR-LAB.md").read
    assert_path_exists lab/"configs/frr/edge-frr.conf"
    assert_predicate lab/"configs/relay/start.sh", :executable?
    assert_match "Usage:", shell_output("#{lab}/deploy.sh --help")
    assert_equal "65001", shell_output("python3 #{lab}/lab-state.py asn --asn 65001").strip
  end
end

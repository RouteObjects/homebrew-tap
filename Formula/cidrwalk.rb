class Cidrwalk < Formula
  desc "Summarize explicit IPv4 or IPv6 ranges into CIDR prefixes"
  homepage "https://github.com/RouteObjects/cidrwalk"
  url "https://github.com/RouteObjects/cidrwalk/archive/refs/tags/0.1.2.tar.gz"
  sha256 "32dd7912313ba436d0f01eb83249cfa46a7ac20bdbca10bb03b0cebdcf2f6305"
  license "Apache-2.0"

  depends_on xcode: ["26.5", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "cidrwalk"
    bin.install ".build/release/cidrwalk"
  end

  test do
    assert_equal "0.1.2\n", shell_output("#{bin}/cidrwalk --version")
    assert_equal "192.0.2.0/24\n",
      shell_output("#{bin}/cidrwalk addresses 192.0.2.0/32 192.0.2.255/32")
  end
end

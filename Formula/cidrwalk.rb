class Cidrwalk < Formula
  desc "Summarize explicit IPv4 or IPv6 ranges into CIDR prefixes"
  homepage "https://github.com/RouteObjects/cidrwalk"
  url "https://github.com/RouteObjects/cidrwalk/archive/refs/tags/0.1.0.tar.gz"
  sha256 "dd1a10b336164f748fa702aa00806f9cb5f78bcc9b7da1d202521b14379aa5d3"
  license "Apache-2.0"

  depends_on macos: :sequoia
  depends_on xcode: ["26.5", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "cidrwalk"
    bin.install ".build/release/cidrwalk"
  end

  test do
    assert_equal "192.0.2.0/24\n",
      shell_output("#{bin}/cidrwalk addresses 192.0.2.0/32 192.0.2.255/32")
  end
end

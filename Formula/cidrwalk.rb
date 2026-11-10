class Cidrwalk < Formula
  desc "Summarize explicit IPv4 or IPv6 ranges into CIDR prefixes"
  homepage "https://github.com/RouteObjects/cidrwalk"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on macos: :sequoia

    on_arm do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.3.0/cidrwalk-0.3.0-darwin-aarch64.tar.gz"
      sha256 "edfb0f43df24e4fc0f0fbc30ceae1c324f37604f0031cac66194b98f7baf69df"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.3.0/cidrwalk-0.3.0-darwin-x86_64.tar.gz"
      sha256 "a8638d7234804b340ee5c3b7523334e78c8b1fc4c22d9ad0509452419b53069e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.3.0/cidrwalk-0.3.0-linux-aarch64.tar.gz"
      sha256 "641d39a39ab8f6372f485675eb15cd19a1dffd6031c7549d1bfe8869daaac660"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.3.0/cidrwalk-0.3.0-linux-x86_64.tar.gz"
      sha256 "76613d131567ffa6f973fe2de257fe93b744b4a89661404160dfe34fa5128057"
    end
  end

  def install
    bin.install "cidrwalk"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.txt"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/cidrwalk --version")
    assert_match "USAGE:", shell_output("#{bin}/cidrwalk --help")
    assert_equal "192.0.2.0/24\n",
      shell_output("#{bin}/cidrwalk addresses 192.0.2.0/32 192.0.2.255/32")
    assert_equal "2001:db8::/126\n",
      shell_output("#{bin}/cidrwalk addresses 2001:db8::/128 2001:db8::3/128")
  end
end

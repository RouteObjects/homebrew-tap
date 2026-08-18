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
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.2.0/cidrwalk-0.2.0-darwin-aarch64.tar.gz"
      sha256 "b761d722212c9c392b66fe01742c8d31fdc999e8fb9bec7bcef3ced2c6d84530"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.2.0/cidrwalk-0.2.0-darwin-x86_64.tar.gz"
      sha256 "9a329ffb5b704e6ce71fcd3666872b18d31682b7b9f138ed69e5ff0a9e841491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.2.0/cidrwalk-0.2.0-linux-aarch64.tar.gz"
      sha256 "fe1b22d6d561920b9d721912818172fbcc735c03b36e6185b32f173cb2cc702a"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.2.0/cidrwalk-0.2.0-linux-x86_64.tar.gz"
      sha256 "a519f15586cbb3faf1dc524e19d7df368935252682d87d823f3f337a7ca4c86c"
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

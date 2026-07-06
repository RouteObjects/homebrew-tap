class Cidrwalk < Formula
  desc "Summarize explicit IPv4 or IPv6 ranges into CIDR prefixes"
  homepage "https://github.com/RouteObjects/cidrwalk"
  version "0.1.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.1.3/cidrwalk-0.1.3-darwin-aarch64.tar.gz"
      sha256 "4b4373107233d5123706640e88d93a319326d4a2d20f98fa57f992b53abdccd1"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.1.3/cidrwalk-0.1.3-darwin-x86_64.tar.gz"
      sha256 "a029a8d7eb7f0edd91d23d6fb87c3651f3afb9c659e44595e3d7b4a8f262297f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.1.3/cidrwalk-0.1.3-linux-aarch64.tar.gz"
      sha256 "cfce51a715455a416e4eda0bef09ef0d1205fdb81554b102a146806085a8f5ee"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrwalk/releases/download/0.1.3/cidrwalk-0.1.3-linux-x86_64.tar.gz"
      sha256 "a13f6df4b4222722249c5dbbef9f1c2ddc2cf0cf53df1ff0242e8c2536a3abf1"
    end
  end

  def install
    bin.install "cidrwalk"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/cidrwalk --version")
    assert_equal "192.0.2.0/24\n",
      shell_output("#{bin}/cidrwalk addresses 192.0.2.0/32 192.0.2.255/32")
  end
end

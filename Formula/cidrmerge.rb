class Cidrmerge < Formula
  desc "Compile IP inputs into a minimal deterministic exact address cover"
  homepage "https://github.com/RouteObjects/cidrmerge"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on macos: :sequoia

    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.3/cidrmerge-0.4.3-darwin-aarch64.tar.gz"
      sha256 "dd6edfd2066fbfbc6a9a817367a8794fcf839d18b567ffaeb96d825b79ed2fa2"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.3/cidrmerge-0.4.3-darwin-x86_64.tar.gz"
      sha256 "652107d07d5570a97a282df714db21ddf3596381ed2de3fc26288c97807f2dcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.3/cidrmerge-0.4.3-linux-aarch64.tar.gz"
      sha256 "0b9ffaebb3061712922c0b055050ed57182871427ecb19369f3af6a9d5f1407d"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.3/cidrmerge-0.4.3-linux-x86_64.tar.gz"
      sha256 "1711506f566788c9849f96881d3fb5f4bdfc98f384e5cf6a31fe1e89d258ff19"
    end
  end

  def install
    bin.install "cidrmerge"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.txt"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/cidrmerge --version")
    assert_match "USAGE:", shell_output("#{bin}/cidrmerge --help")
    assert_equal "192.0.2.0...192.0.2.255\n",
      pipe_output("#{bin}/cidrmerge --raw", "192.0.2.0/25\n192.0.2.128/25\n")
  end
end

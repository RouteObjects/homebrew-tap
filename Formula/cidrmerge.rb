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
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.0/cidrmerge-0.4.0-darwin-aarch64.tar.gz"
      sha256 "444dcf73f3592316c4722a7fac94b0ea3507449fe923387d9dff0edd88dd793e"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.0/cidrmerge-0.4.0-darwin-x86_64.tar.gz"
      sha256 "3e9708c177ca2c09cbd9300940389fd7bd75fd1caafa4d8764a005d553ed7b85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.0/cidrmerge-0.4.0-linux-aarch64.tar.gz"
      sha256 "6fe837d00a94b1ef2a428b6c2ee6e375dc6e8cdb7b8bd9db82bb7f64ceb057a6"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.0/cidrmerge-0.4.0-linux-x86_64.tar.gz"
      sha256 "df9f7c84e674c99714c7a2401babc00a03ace58e17d45681ff172b35592c1d6b"
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

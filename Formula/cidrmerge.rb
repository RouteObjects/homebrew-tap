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
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.1/cidrmerge-0.4.1-darwin-aarch64.tar.gz"
      sha256 "d719ad1a145500f9c41deb08a50ddfc12d3cdc50d9c417d46532664f926cb2a4"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.1/cidrmerge-0.4.1-darwin-x86_64.tar.gz"
      sha256 "234b65cacb8e64514c8b77d7a8d41fe42bec6a037e4ab110e4e26eaecc3edcb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.1/cidrmerge-0.4.1-linux-aarch64.tar.gz"
      sha256 "be68675efd2e204e596a3d3d89c161e4a52a9c7996f176257d78e4d163658e5e"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.4.1/cidrmerge-0.4.1-linux-x86_64.tar.gz"
      sha256 "d7270242bbf6536cf459ac9267c34b43b8916e3972f6ba8163e0d455edb62fa2"
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

class Asroutes < Formula
  desc "List IPv4 or IPv6 IRR route-object prefixes for origin AS numbers"
  homepage "https://github.com/RouteObjects/asroutes"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on macos: :sequoia

    on_arm do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.1.0/asroutes-0.1.0-darwin-aarch64.tar.gz"
      sha256 "3a09a77a0c16aecfce5b062453a5b651d6644994438623a739264d663ce755e7"
    end
    on_intel do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.1.0/asroutes-0.1.0-darwin-x86_64.tar.gz"
      sha256 "a086181811db42bf73ae05d89099833d13978e7c2dced5076ee275c4635ec64a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.1.0/asroutes-0.1.0-linux-aarch64.tar.gz"
      sha256 "d28bbf27d1142c9b9d56333b618b5fe268dc1d0ea41a18235a19f3248d70c713"
    end
    on_intel do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.1.0/asroutes-0.1.0-linux-x86_64.tar.gz"
      sha256 "1b7b84520e3d3b580ca4d4b0baced5cf0652f22fc22d6ef51d89e8b286857d9b"
    end
  end

  def install
    bin.install "asroutes"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.txt"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/asroutes --version")
    assert_match "USAGE:", shell_output("#{bin}/asroutes --help")
  end
end

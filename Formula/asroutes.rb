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
      url "https://github.com/RouteObjects/asroutes/releases/download/0.2.0/asroutes-0.2.0-darwin-aarch64.tar.gz"
      sha256 "8a2af27c46170b3e5143fd810d4e442137dcb89c5e639cd6ab73b49539d2459e"
    end
    on_intel do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.2.0/asroutes-0.2.0-darwin-x86_64.tar.gz"
      sha256 "a12dd54e31b3e0568a9a08a5ffe18bf75e35a0460e66f4a6bbeb34909c4db181"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.2.0/asroutes-0.2.0-linux-aarch64.tar.gz"
      sha256 "ceb21212f89e97b585600f4c483178ba0eefc4f180733957777aed7c46c0e24e"
    end
    on_intel do
      url "https://github.com/RouteObjects/asroutes/releases/download/0.2.0/asroutes-0.2.0-linux-x86_64.tar.gz"
      sha256 "9c17dfdb2f81e815b979932fa4ddb0e679112f3f62a06230f2e48c022238a10c"
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

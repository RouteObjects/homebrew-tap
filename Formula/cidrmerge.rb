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
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.1.0/cidrmerge-0.1.0-darwin-aarch64.tar.gz"
      sha256 "79af3a7a56b607d28e8985e79a87334cdae29db3474386f9d09117ae6505d663"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.1.0/cidrmerge-0.1.0-darwin-x86_64.tar.gz"
      sha256 "f81127a957cbbb7b85132aea043e63696b33d22a8e7293018610f5bd7a50a02d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.1.0/cidrmerge-0.1.0-linux-aarch64.tar.gz"
      sha256 "c88f1f6731de4a8dbb5063894bf06c394c624fca41da7a5057e8d0c36111bab8"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.1.0/cidrmerge-0.1.0-linux-x86_64.tar.gz"
      sha256 "6cf33e5eed26cdeedc9249e1c039e963182dd22e2f348a728113035ef3fae927"
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

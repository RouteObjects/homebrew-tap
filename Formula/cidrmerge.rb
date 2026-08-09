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
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.2.0/cidrmerge-0.2.0-darwin-aarch64.tar.gz"
      sha256 "7459d93408bc46398b7012761b8eeb5b81c31923f1ee3029bc99a6138659b638"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.2.0/cidrmerge-0.2.0-darwin-x86_64.tar.gz"
      sha256 "9ff44cefa1b87421656f7aa1e9eb4918b8a54f02e1bf79c6197bad21aa6c5f3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.2.0/cidrmerge-0.2.0-linux-aarch64.tar.gz"
      sha256 "826c3dfc6cee39bcb54ed3242a959c4fe56769913bef5b5e884154d5ba6cd357"
    end
    on_intel do
      url "https://github.com/RouteObjects/cidrmerge/releases/download/0.2.0/cidrmerge-0.2.0-linux-x86_64.tar.gz"
      sha256 "1e071300369ceefde00151e188b33f5822942d0d01fe8a44c32fe7950c99675e"
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
